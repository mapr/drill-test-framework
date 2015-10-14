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

import com.google.common.collect.Lists;
import org.apache.drill.test.framework.TestCaseModeler.TestMatrix;
import org.apache.drill.test.framework.TestDriver.Options;
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
  private TestCaseModeler modeler;
  private TestMatrix matrix;
  private Thread thread;
  private List<Integer> types;
  private List columnLabels = new ArrayList<String>();
  private Random rand = new Random();

  public DrillTestJdbc(TestCaseModeler modeler, ConnectionPool connectionPool) {
    this.modeler = modeler;
    this.connectionPool = connectionPool;
    this.matrix = modeler.matrices.get(0);
  }
  
 
  public void run() {
    this.thread = Thread.currentThread();
    setTestStatus(TestStatus.RUNNING);
    int mainQueryIndex = 0;
    String[] queries = null;
    try {
      connection = connectionPool.getOrCreateConnection(modeler);
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
    try {
      LOG.info("running test " + matrix.inputFile + " " + connection.hashCode());

      executeSetupQuery(String.format("use `%s`", matrix.schema));

      queries = Utils.getSqlStatements(matrix.inputFile);
      mainQueryIndex = queries.length / 2; // Currently, the main query must be in the middle of the list of queries

      for (int i = 0; i < mainQueryIndex; i++) {
        executeSetupQuery(queries[i]);
        Thread.sleep(1000);
      }
      
      query = queries[mainQueryIndex];
      executeQuery(query);
        
      testVerifier = new TestVerifier(types, query, columnLabels, matrix.verificationTypes);
      if (query.startsWith("explain") || matrix.verificationTypes.get(0).equalsIgnoreCase("regex")) {
        setTestStatus(testVerifier.verifyTextPlan(matrix.expectedFile, outputFilename));
      } else {
        setTestStatus(testVerifier.verifyResultSet(matrix.expectedFile, outputFilename));
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
			e1.printStackTrace();
		}
      }
      if (testStatus == TestStatus.PASS && !TestDriver.OPTIONS.outputQueryResult) {
    	Utils.deleteFile(outputFilename);
      }
      LOG.info("Completed test " + matrix.inputFile + ". Status " + testStatus);
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
        LOG.info(query + " " + connection.hashCode());
      }
      Statement statement = connection.createStatement();
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

    outputFilename = Utils.generateOutputFileName(matrix.inputFile, modeler.testId, false);
    BufferedWriter writer = new BufferedWriter(new FileWriter(new File(
            outputFilename)));
    final boolean cancelQuery = rand.nextInt(100) < TestDriver.OPTIONS.cancelPercent;
    CancelQuery c = null;
    try {
      Statement statement = connection.createStatement();
      resultSet = statement.executeQuery(query);      
      if (cancelQuery) {
    	c = new CancelQuery(statement);
    	c.start();
      }
      
    } catch (SQLException e) {
      writer.write(e.getErrorCode() + "\t" + e.getMessage());
      if (writer != null) {
          writer.close();
        }
      if (resultSet != null) {
          resultSet.close();
        }
      if (modeler.negative) return;
      throw e;
    } finally {
      if (cancelQuery) {
    	try {
    	  c.join();
    	  if (testStatus == TestStatus.CANCELED) {
    	    if (resultSet != null) {
    	      resultSet.close();
    	    }
    	    if (writer != null) {
    	      writer.close();
    	    }
    		return;
    	  }
    	} catch (InterruptedException e) {return;}
      }
    }
    
    try {
      int columnCount = resultSet.getMetaData().getColumnCount();
      for (int i = 1; i <= columnCount; i++) {
        columnLabels.add(resultSet.getMetaData().getColumnLabel(i));
      }
      types = Lists.newArrayList();
      for (int i = 1; i <= columnCount; i++) {
        types.add(resultSet.getMetaData().getColumnType(i));
      }

      LOG.debug("Result set data types:");
      LOG.debug(Utils.getTypesInStrings(types));

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
        ColumnList columnList = new ColumnList(types, values);
        if (writer != null) {
          writer.write(columnList + "\n");
        }
      }
    } catch (IllegalArgumentException | IllegalAccessException | IOException e1) {
		if (testStatus != TestStatus.CANCELED) LOG.warn(e1);
	} finally {
      if (resultSet != null) {
        resultSet.close();
      }
      if (writer != null) {
        writer.close();
      }
    }
  }

  @Override
  public void cancel() {
    thread.interrupt();
    setTestStatus(TestStatus.TIMEOUT);
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
	if (testStatus == TestStatus.CANCELED) return;
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
    return matrix.inputFile;
  }

  @Override
  public String getQuery() {
    return query;
  }
}
