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
import org.apache.drill.test.framework.TestVerifier.PlanVerificationException;
import org.apache.log4j.Logger;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
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

public class DrillTestOdbc implements DrillTest{
  private static final Logger LOG = Logger.getLogger(DrillTestOdbc.class);

  private String query = null;
  private String outputFilename;
  private volatile TestStatus testStatus = TestStatus.PENDING;
  private Exception exception;
  private DrillTestCase modeler;
  private Stopwatch duration;
  private TestMatrix matrix;
  private List<Integer> columnTypes;
  private List columnLabels = new ArrayList<String>();
  private Thread thread;
  private int id;
  private int totalCases;

  private static volatile int noOfCasesCompleted;
  
  public DrillTestOdbc(DrillTestCase modeler, int id, int totalCases) {
	this.id = id;
	this.modeler = modeler;
        this.matrix = modeler.matrices.get(0);
        this.totalCases = totalCases;
  }
  
  public void run() {
    final Stopwatch stopwatch = Stopwatch.createStarted();
    this.thread = Thread.currentThread();
    int mainQueryIndex = -1;
    String[] queries = null;

    setTestStatus(TestStatus.RUNNING);
    try {
      outputFilename = Utils.generateOutputFileName(modeler.queryFilename, modeler.testId, false) + "_" + id;
    } catch (IOException e) {
      LOG.error(e.getMessage());
      throw new RuntimeException(e);
    }
  	CmdConsOut cmdConsOut = null;
    String command = System.getProperty("user.dir") + "/" 
    		+ DrillTestDefaults.DRILL_TESTDATA_DIR + "/"
    		+ modeler.script + " "
    		+ modeler.queryFilename + " "
    		+ outputFilename;
    LOG.info("Running test " + command);
    try {

      cmdConsOut = Utils.execCmd(command);
      if (cmdConsOut.exitCode > 0) {
        throw new RuntimeException("ERROR: exitCode " + cmdConsOut.exitCode + "\n" + cmdConsOut.consoleOut);
      }

      queries = Utils.getSqlStatements(modeler.queryFilename);
      for (int i = 0; i < queries.length && mainQueryIndex == -1; i++) {
        if (queries[i].startsWith("--@test")) {
          mainQueryIndex = i;
        }
      }
      if (mainQueryIndex == -1) {
        mainQueryIndex = queries.length / 2; // Currently, the main query must be in the middle of the list of queries
      }
      query = queries[mainQueryIndex];

      // extract column types into columnTypes and column names into columnLabels
      getColumnNamesAndTypes(modeler.queryFilename);

      switch (cmdConsOut.exitCode) {
      case 0:
        TestVerifier testVerifier = new TestVerifier(columnTypes, query, columnLabels, matrix.verificationTypes);
        try {
          if (query.startsWith("explain") || matrix.verificationTypes.get(0).equalsIgnoreCase("regex") ||
                matrix.verificationTypes.get(0).equalsIgnoreCase("regex-no-order") ||
                matrix.verificationTypes.get(0).equalsIgnoreCase("filter-ratio")) {
            setTestStatus(testVerifier.verifyTextPlan(modeler.expectedFilename, outputFilename));
          } else {
            // "in-memory"
            setTestStatus(testVerifier.verifyResultSet(modeler.expectedFilename, outputFilename));
          }
        } catch (VerificationException e) {
          fail(TestStatus.DATA_VERIFICATION_FAILURE, e);
        } catch (PlanVerificationException e) {
          fail(TestStatus.PLAN_VERIFICATION_FAILURE, e);
        };
        break;
      case 1:
        setTestStatus(TestStatus.EXECUTION_FAILURE);
        break;
      case 2:
        setTestStatus(TestStatus.DATA_VERIFICATION_FAILURE);
        break;
      case 3:
        setTestStatus(TestStatus.ORDER_MISMATCH);
        break;
      case 4:
        setTestStatus(TestStatus.TIMEOUT);
        break;
      case 5:
    	setTestStatus(TestStatus.CANCELED);
      default:
        setTestStatus(TestStatus.EXECUTION_FAILURE);
      }
    } catch (Exception e) {
      LOG.info("execution exception " + e.getMessage());
      fail(TestStatus.EXECUTION_FAILURE, e);
    } finally {
      if (testStatus == TestStatus.PASS && !TestDriver.cmdParam.outputQueryResult) {
    	Utils.deleteFile(outputFilename);
      }
      duration = stopwatch;

      LOG.info(testStatus + " (" + stopwatch + ") " + modeler.script + " " +
               modeler.queryFilename);
      if(++noOfCasesCompleted%100==0 && noOfCasesCompleted <= totalCases){
        LOG.info("----------------------------------------------------------------------------------------------------------------");

        LOG.info("Execution completed for "+(noOfCasesCompleted)+" out of "+
                 (totalCases)+" tests");
        LOG.info("----------------------------------------------------------------------------------------------------------------\n");
      }
    }
  }
  
  protected void fail(TestStatus status, Exception e) {
	if (testStatus == TestStatus.TIMEOUT) {
	  return;
	}
	setTestStatus(status);
	exception = e;
  }
  
  @Override
  public void cancel() {
	setTestStatus(TestStatus.TIMEOUT);
	thread.interrupt();
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
  public String getExpectedFile(){
    return modeler.expectedFilename;
  }

  @Override
  public String getQuery() {
	if (query == null) {
	  String[] queries = null;
	  try {
		queries = Utils.getSqlStatements(modeler.queryFilename);
	  } catch (IOException e) {
		e.printStackTrace();
	  }
	  int mainQueryIndex = queries.length / 2; // Currently, the main query must be in the middle of the list of queries
	  query = queries[mainQueryIndex];
	}
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

  // The python script that executes queries using the Simba
  // ODBC driver, creates two metadata files for each query file.
  // A <query_file>.type file contains a list of the data types
  // for the columns returned by the query.
  // A <query_file>.label file contains a list of the column names
  // returned by the query.
  // These files are scanned, and the types and column names are
  // loaded into columnTypes and columnLabels, so they can be passed
  // to TestVerifier.
  private void getColumnNamesAndTypes(String queryFilename)
          throws IOException {
        columnTypes = Lists.newArrayList();
        int index = queryFilename.lastIndexOf('.');
        String filename = queryFilename.substring(0, index);
        String typeFilename = filename + ".type";
        BufferedReader reader = new BufferedReader(new FileReader(new File(typeFilename)));
        String line = "";
        while ((line = reader.readLine()) != null) {
           int value = Integer.parseInt(line);
           columnTypes.add(value);
        }

        String labelFilename = filename + ".label";
        reader = new BufferedReader(new FileReader(new File(labelFilename)));
        while ((line = reader.readLine()) != null) {
           columnLabels.add(line);
        }
  }
}
