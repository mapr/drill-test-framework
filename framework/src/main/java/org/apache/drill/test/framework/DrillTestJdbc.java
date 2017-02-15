/**
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.apache.drill.test.framework;

import com.google.common.base.Stopwatch;
import com.google.common.collect.Lists;
import org.apache.drill.test.framework.TestCaseModeler.TestMatrix;
import org.apache.drill.test.framework.TestVerifier.TestStatus;
import org.apache.drill.test.framework.TestVerifier.VerificationException;
import org.apache.log4j.Logger;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.atomic.AtomicBoolean;

public class DrillTestJdbc implements DrillTest {
  private static final Logger LOG = Logger.getLogger(DrillTestJdbc.class);

  private ConnectionPool connectionPool;
  private Connection connection;
  private String query;
  private String outputFilename;
  private ResultSet resultSet;
  private volatile TestStatus testStatus = TestStatus.PENDING;
  private Exception exception;
  private TestVerifier testVerifier;
  private DrillTestCase modeler;
  private Stopwatch duration;
  private TestMatrix matrix;
  private Thread thread;
  private List<Integer> columnTypes;
  private List<Integer> columnNullabilities;
  private List<Integer> columnSizes;
  private List columnLabels = new ArrayList<String>();
  private Random rand = new Random();
  private Statement statement = null;
  private AtomicBoolean doneProcessingResultSet = new AtomicBoolean(false);
  private int id;

  public DrillTestJdbc(DrillTestCase modeler, ConnectionPool connectionPool, int id) {
	this.id = id;
    this.modeler = modeler;
    this.connectionPool = connectionPool;
    this.matrix = modeler.matrices.get(0);
  }
  
 
  public void run() {
    final Stopwatch stopwatch = Stopwatch.createStarted();
    this.thread = Thread.currentThread();
    setTestStatus(TestStatus.RUNNING);
    int mainQueryIndex = 0;
    String[] queries = null;
    try {
      connection = connectionPool.getOrCreateConnection(modeler);
    } catch (SQLException e) {
      LOG.error(e.getMessage());
      throw new RuntimeException(e);
    }
    try {
      LOG.debug("Running test " + modeler.queryFilename + " (connection: " + connection.hashCode() + ")");

      if (!modeler.type.equalsIgnoreCase("impersonation")) {
        executeSetupQuery(String.format("use `%s`", matrix.schema));
      }

      queries = Utils.getSqlStatements(modeler.queryFilename);
      mainQueryIndex = queries.length / 2; // Currently, the main query must be in the middle of the list of queries

      for (int i = 0; i < mainQueryIndex; i++) {
        executeSetupQuery(queries[i]);
        Thread.sleep(1000);
      }
      
      query = queries[mainQueryIndex];
      executeQuery(query);
      
      testVerifier = new TestVerifier(columnTypes, query, columnLabels, matrix.verificationTypes);
      if (query.startsWith("explain") || matrix.verificationTypes.get(0).equalsIgnoreCase("regex") ||
          matrix.verificationTypes.get(0).equalsIgnoreCase("regex-no-order") ||
          matrix.verificationTypes.get(0).equalsIgnoreCase("filter-ratio")) {
        setTestStatus(testVerifier.verifyTextPlan(modeler.expectedFilename, outputFilename));
      } else {
        setTestStatus(testVerifier.verifyResultSet(modeler.expectedFilename, outputFilename));
      }
      
      if (modeler.type.equalsIgnoreCase("limit 0")) {
    	  String limitZeroQuery = "select * from (" + query + ") t limit 0";
    	  executeLimitZeroQuery(limitZeroQuery);
      }
    } catch (VerificationException e) {
      fail(TestStatus.VERIFICATION_FAILURE, e);
    } catch (Exception e) {
      fail(TestStatus.EXECUTION_FAILURE, e);
	} finally {
      try {
        for (int i = mainQueryIndex + 1; i < queries.length; i++) {
          Thread.sleep(1000);
          executeSetupQuery(queries[i]);
        }
        Thread.sleep(1000);
        connectionPool.releaseConnection(modeler, connection);
      } catch (Exception e) {
        LOG.error("Failed while running cleanup query. Not returning connection to pool.", e);
        try {
			connection.close();
		} catch (SQLException e1) {
			LOG.warn(e.getMessage());
			e1.printStackTrace();
		}
      }
      if (testStatus == TestStatus.PASS && !TestDriver.cmdParam.outputQueryResult) {
    	Utils.deleteFile(outputFilename);
      }
      duration = stopwatch;
      LOG.info(testStatus + " (" + stopwatch + ") " + modeler.queryFilename + " (connection: " + connection.hashCode() + ")");
    }
  }

  private void fail(TestStatus status, Exception e) {
    if (testStatus == TestStatus.TIMEOUT) {
      return;
    }
    setTestStatus(status);
    exception = e;
  }

  private void executeSetupQuery(String query) throws SQLException {
    try {
      if (query.contains("alter")) {
        LOG.debug(query + " " + connection.hashCode());
      }
      statement = connection.createStatement();
      resultSet = statement.executeQuery(query);
    } finally {
      if (resultSet != null) {
        // TODO(DRILL-2560) : Once resolved, we can use statement#executeUpdate instead of exhausting the result set
        while (resultSet.next());
        resultSet.close();
      }
    }
  }

  private void executeQuery(String query) throws IOException, SQLException {
    outputFilename = Utils.generateOutputFileName(modeler.queryFilename, modeler.testId, false) + "_" + id;
    BufferedWriter writer = new BufferedWriter(new FileWriter(new File(
            outputFilename)));
    final boolean cancelQuery = rand.nextInt(100) < TestDriver.cmdParam.cancelPercent;
    CancelQuery c = null;
    try {
      statement = connection.createStatement();
      resultSet = statement.executeQuery(query);      
      if (cancelQuery) {
    	c = new CancelQuery(statement);
    	c.start();
      }
      
    } catch (SQLException e) {
      writer.write(e.getErrorCode() + "\t" + e.getMessage());
      if (writer != null) {writer.close();}
      if (resultSet != null) {resultSet.close();}
      if (modeler.negative) {return;}
      throw e;
    } finally {
      if (cancelQuery) {
    	try {
    	  c.join();
    	  if (testStatus == TestStatus.CANCELED) {
    	    if (resultSet != null) {resultSet.close();}
    	    if (writer != null) {writer.close();}
    		return;
    	  }
    	} catch (InterruptedException e) {return;}
      }
    }
    
    try {
      columnLabels = Lists.newArrayList();
      columnTypes = Lists.newArrayList();
      columnNullabilities = Lists.newArrayList();
      columnSizes = Lists.newArrayList();
      int columnCount = resultSet.getMetaData().getColumnCount();
      for (int i = 1; i <= columnCount; i++) {
        columnLabels.add(resultSet.getMetaData().getColumnLabel(i));
        columnTypes.add(resultSet.getMetaData().getColumnType(i));
        columnNullabilities.add(resultSet.getMetaData().isNullable(i));
        columnSizes.add(resultSet.getMetaData().getColumnDisplaySize(i));
      }

      LOG.debug("Result set data types:");
      LOG.debug(Utils.getTypesInStrings(columnTypes));

      while (resultSet.next()) {
        List<Object> values = Lists.newArrayList();
        for (int i = 1; i <= columnCount; i++) {
          try {
            if (resultSet.getObject(i) == null) {
              values.add(null);
              continue;
            }
            if (resultSet.getMetaData().getColumnType(i) == Types.NVARCHAR) {
              values.add(new String(resultSet.getBytes(i), "UTF-16"));
            } else {
              values.add(new String(resultSet.getBytes(i), "UTF-8"));
            }
          } catch (Exception e) {
            if (resultSet.getMetaData().getColumnType(i) == Types.DATE) {
              values.add(resultSet.getDate(i));
            } else {
              values.add(resultSet.getObject(i));
            }
          }
        }
        ColumnList columnList = new ColumnList(columnTypes, values);
        if (writer != null) {
          writer.write(columnList + "\n");
        }
      }

    } catch (IllegalArgumentException | IllegalAccessException | IOException e1) {
		LOG.warn(e1);
	} finally {
	  doneProcessingResultSet.set(true);
      if (resultSet != null) {
        resultSet.close();
      }
      if (writer != null) {
        writer.close();
      }
    }
  }

  private void executeLimitZeroQuery(String query) throws IOException, SQLException {
	if (getTestStatus() == TestStatus.CANCELED || getTestStatus() == TestStatus.EXECUTION_FAILURE) {
		return;
	}
	
	BufferedWriter writer = new BufferedWriter(new FileWriter(new File(outputFilename),true));	
    statement = connection.createStatement();
    ResultSet resultSet = statement.executeQuery(query);
    List columnLabels = new ArrayList<String>();
    List<Integer> columnTypes = Lists.newArrayList();
    List<Integer> columnNullabilities = Lists.newArrayList();
    List<Integer> columnSizes = Lists.newArrayList();
    
    try {
      int columnCount = resultSet.getMetaData().getColumnCount();
      for (int i = 1; i <= columnCount; i++) {
        columnLabels.add(resultSet.getMetaData().getColumnLabel(i));
        columnTypes.add(resultSet.getMetaData().getColumnType(i));
        columnNullabilities.add(resultSet.getMetaData().isNullable(i));
        columnSizes.add(resultSet.getMetaData().getColumnDisplaySize(i));
      }
      
      String msg = "\nlimit 0: " + query + "\n" 
    		  + "limit 0: " + columnLabels + "\n" 
    		  + "regular: " + this.columnLabels + "\n"
    		  + "\nlimit 0: " + Utils.getTypesInStrings(columnTypes) + "\n"
    		  + "regular: " + Utils.getTypesInStrings(this.columnTypes) + "\n"
    		  + "\nlimit 0: " + Utils.getNullabilitiesInStrings(columnNullabilities) + "\n"
    		  + "regular: " + Utils.getNullabilitiesInStrings(this.columnNullabilities) + "\n"
    		  + "\nlimit 0: " + columnSizes + "\n"
    		  + "regular: " + this.columnSizes + "\n";
      writer.append(msg);
      
      if (!columnLabels.equals(this.columnLabels) || !columnTypes.equals(this.columnTypes)
          || !isNullabilityCompatible(columnNullabilities, this.columnNullabilities)
          || !columnSizes.equals(this.columnSizes))  {
        LOG.info(msg);
        setTestStatus(TestStatus.VERIFICATION_FAILURE);
        exception = exception == null? new VerificationException(msg)
        	: new VerificationException(exception + "\n" + msg);
      }
    } catch (IllegalArgumentException | IllegalAccessException e1) {
      LOG.warn(e1);
    } finally {
      if (resultSet != null) resultSet.close();
      if (writer != null) writer.close();
    }
  }

  private boolean isNullabilityCompatible(List<Integer> limitZero, List<Integer> regular) {
    for(int i = 0; i < limitZero.size(); ++i) {
      final int nullabilityLimitZero = limitZero.get(i);
      final int nullabilityRegular = regular.get(i);

      // Going from NoNullable (for schema) to Nullable (for regular)
      // will lead to incorrect result
      if(nullabilityLimitZero == 0
          && nullabilityRegular == 1) {
        return false;
      }
    }

    return true;
  }
  
  @Override
  public void cancel() {
	setTestStatus(TestStatus.TIMEOUT);
	if (statement != null) {
	  try {
		statement.cancel();
	  } catch (SQLException e) {
		LOG.warn("Cancel after timeout failed!");
		e.printStackTrace();
	  }
	}
	int i = 0;
	while (!doneProcessingResultSet.get() && i < 10) {
	  try {
		Thread.currentThread().sleep(1000);
	  } catch (InterruptedException e) {
		e.printStackTrace();
		return;
	  }
	  i++;
	}
	if (!doneProcessingResultSet.get()) {
      
	  LOG.warn("Cancel after timeout may have failed!");
	  thread.interrupt();
	}
  }

  private class CancelQuery extends Thread {
	private final Statement statement;
	CancelQuery(Statement statement) {
	  this.statement = statement;
	}
	public void run() {
	  try {
		Thread.sleep(rand.nextInt(3000));
		statement.cancel();
		setTestStatus(TestStatus.CANCELED);
	  } catch (InterruptedException | SQLException e) {}
	}
  }
  
  public synchronized void setTestStatus(TestStatus status) {
	testStatus = status;
  }
	 
  @Override
  public TestStatus getTestStatus() {
    return testStatus;
  }

  @Override
  public Exception getException() {
    return exception;
  }

  @Override
  public String getInputFile() {
    return modeler.queryFilename;
  }

  @Override
  public String getQuery() {
    return query;
  }

  @Override
  public String getTestId() {
    return modeler.testId;
  }

  @Override
  public int getCloneId() {
    return id;
  }

  @Override
  public Stopwatch getDuration() {
    return duration;
  }
}
