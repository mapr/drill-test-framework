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

import com.beust.jcommander.JCommander;
import com.beust.jcommander.ParameterException;
import com.google.common.base.Stopwatch;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import org.apache.drill.test.framework.TestCaseModeler.DataSource;
import org.apache.drill.test.framework.TestVerifier.TestStatus;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.FileUtil;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.mapred.FileAlreadyExistsException;
import org.apache.log4j.Logger;
import org.ojai.Document;
import org.ojai.json.Json;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.DatabaseMetaData;

public class TestDriver {
  private static final Logger LOG = Logger.getLogger("DrillTestLogger");
  private Connection connection = null;
  public static String commitId, version;
  private String[] injectionKeys = {"DRILL_VERSION"};
  public static Map<String,String> injections = Maps.newHashMap();
  private long [][] memUsage = new long[2][3];
  private String memUsageFilename = null;
  private ConnectionPool connectionPool;
  private int countTotalTests;
  private Properties connectionProperties;

  private static Configuration conf = new Configuration();
  public static final CmdParam cmdParam = new CmdParam();
  
  public TestDriver() {
    connectionProperties = Utils.createConnectionProperties();
    connectionPool = new ConnectionPool(connectionProperties);
  }
  
  public static void main(String[] args) throws Exception {
    JCommander jc = new JCommander(cmdParam);
    jc.setProgramName("TestDriver");
    try {
      jc.parse(args);
      
    } catch (ParameterException e) {
      System.out.println("\n" + e.getMessage() + "\n");
      jc.usage();
      System.exit(-1);
    }
    if (cmdParam.help) {
      jc.usage();
      System.exit(0);
    }

    final Stopwatch stopwatch = Stopwatch.createStarted();
    int errorCode=0;
    Date startDate =null;
    try {
      startDate = new Date();
      errorCode = new TestDriver().runTests();
    } catch (Exception e) {
      LOG.error("Exiting due to uncaught exception", e);
      errorCode = -1;
    } finally {
      LOG.info("\n"+DrillTestDefaults.LINE_BREAK+"\nRUN STATUS\n"+DrillTestDefaults.LINE_BREAK);
      LOG.info("Exit Code      : " + errorCode);
      LOG.info("Exit Status    : " + ((errorCode==0) ? "SUCCESS" : "FAILURE"));
      LOG.info("\nRun Started    : " + startDate);
      LOG.info("Run Completed  : " + new Date());
      LOG.info("Total Duration : " + stopwatch);
      LOG.info(DrillTestDefaults.LINE_BREAK);
    }
    System.exit(errorCode);
  }

  public int runTests() throws Exception {

    LOG.info(DrillTestDefaults.LINE_BREAK +
        "\nDRILL TEST FRAMEWORK VERSION\n" +
        DrillTestDefaults.LINE_BREAK + "\n" +
        Utils.getFrameworkVersion() + "\n" +
        DrillTestDefaults.LINE_BREAK + "\n");
   
    List<List<DrillTest>> executionFailureExceptions=Lists.newArrayList(); 
    for(int ii=0;ii<DrillTestDefaults.DRILL_EXCEPTION_REGEXES.length;ii++){
       executionFailureExceptions.add(new ArrayList<DrillTest>());
       //List<DrillTest> temp = (List<DrillTest>)Lists.newArrayList();
       //executionFailureExceptions.add((temp);
    }
    HashMap<String,Integer> exceptionMessageSet = new HashMap<String,Integer>(); 
    CancelingExecutor executor = new CancelingExecutor(cmdParam.threads, cmdParam.timeout);

    final Stopwatch stopwatch = Stopwatch.createStarted();
    try {
      connection = connectionPool.getOrCreateConnection();
    } catch (SQLException e) {
      e.printStackTrace();
      System.exit(-1);
    }
    
    //Record JDBC driver name, version and other metadata info
    DatabaseMetaData dm = connection.getMetaData();
    LOG.info(DrillTestDefaults.LINE_BREAK +"\nJDBC DRIVER METADATA CATALOG\n"+DrillTestDefaults.LINE_BREAK+"\n"+ new DBMetaData(dm).toString() + DrillTestDefaults.LINE_BREAK);
/*    LOG.info(DrillTestDefaults.LINE_BREAK + "Product name = " + dm.getDatabaseProductName() + "\n"
    		 + "Product version = " + dm.getDatabaseProductVersion() + "\n"
    		 + "Product major version = " + dm.getDatabaseMajorVersion() + "\n"
    		 + "Product minor version = " + dm.getDatabaseMinorVersion() + "\n"
    		 + "Driver name = " + dm.getDriverName() + "\n"
    		 + "Driver version = " + dm.getDriverVersion() + "\n"
    		 + "Driver major version = " + dm.getDriverMajorVersion() + "\n"
    		 + "Driver minor version = " + dm.getDriverMinorVersion() + "\n" + DrillTestDefaults.LINE_BREAK); */

    //Check number of drillbits equals number of cluster nodes    
    int numberOfDrillbits = Utils.getNumberOfDrillbits(connection);
    connectionPool.releaseConnection(connection);
    int numberOfClusterNodes = DrillTestDefaults.NUMBER_OF_CLUSTER_NODES;
    if (numberOfClusterNodes != 0 && numberOfClusterNodes != numberOfDrillbits) {
    	LOG.error("\n> Pre-check failed\n\t>> Number of cluster nodes configured = "
    			+ numberOfClusterNodes + ";\n\t>> Number of drillbits = " + numberOfDrillbits);
    	System.exit(-1);
    }
    stopwatch.reset().start();
    LOG.info("\n"+DrillTestDefaults.LINE_BREAK+"\nINIT\n"+DrillTestDefaults.LINE_BREAK);
    setup();
    LOG.info("> INIT duration: " + stopwatch+"\n"+DrillTestDefaults.LINE_BREAK);

    List<DrillTestCase> drillTestCases = Utils.getDrillTestCases();
    List<DrillTest> tests = Lists.newArrayList();
    for (DrillTestCase testCase : drillTestCases) {
      for (int clone = 0; clone < cmdParam.clones; clone++) {
        tests.add(getDrillTest(testCase, connectionPool, clone, drillTestCases.size()));
      }
    }
    countTotalTests = drillTestCases.size();

    HashSet  <DrillTest> finalExecutionFailures = new HashSet<DrillTest>();
    HashSet  <DrillTest> finalDataVerificationFailures = new HashSet<DrillTest>();
    HashSet  <DrillTest> finalPlanVerificationFailures = new HashSet<DrillTest>();
    HashSet  <DrillTest> finalCancelledFailures = new HashSet<DrillTest>();
    HashSet  <DrillTest> finalRandomFailures = new HashSet<DrillTest>();
    HashSet  <DrillTest> finalTimeoutFailures = new HashSet<DrillTest>();
    int totalRandomFailures = 0;
    int totalPassingTests = 0;
    int totalExecutionFailures = 0;
    int totalDataVerificationFailures = 0;
    int totalPlanVerificationFailures = 0;
    int totalTimeoutFailures = 0;
    int totalCancelledFailures = 0;
    int i;

    if (cmdParam.trackMemory) {
  	  queryMemoryUsage();
    }

    // Run Apache Minio server if s3minio tests aren't excluded
    if(cmdParam.excludeDependencies == null || !cmdParam.excludeDependencies.contains("s3minio")) {
      Utils.startMinio();
    } else {
      // Disable s3minio storage plugin if Minio server is down
      String templatePath = DrillTestDefaults.CWD + "/conf/plugin-templates/common/s3minio-storage-plugin.template";
      boolean isSuccess = Utils.disableStoragePlugin(templatePath, "s3minio");
      if(!isSuccess){
        LOG.info("> Fail to disable s3minio storage plugin");
      }
    }

    for (i = 1; i < cmdParam.iterations+1; i++) {
      
      List<DrillTest> passingTests = Lists.newArrayList();
      List<DrillTest> dataVerificationFailures = Lists.newArrayList();
      List<DrillTest> planVerificationFailures = Lists.newArrayList();
      List<DrillTest> executionFailures = Lists.newArrayList();
      List<DrillTest> timeoutFailures = Lists.newArrayList();
      List<DrillTest> canceledTests = Lists.newArrayList();
      List<DrillTest> randomFailures = Lists.newArrayList();
      List<DrillTest> failingTests = Lists.newArrayList();
      executionFailureExceptions = Lists.newArrayList(); 
      for(int ii=0;ii<DrillTestDefaults.DRILL_EXCEPTION_REGEXES.length;ii++){
       executionFailureExceptions.add(new ArrayList<DrillTest>());
      }
      //PREPARATION
      stopwatch.reset().start();

      if (cmdParam.generate) {
        prepareData(drillTestCases);
      }
      stopwatch.reset().start();

      Collections.shuffle(tests, new Random());
      List<DrillTest> new_tests = Lists.newArrayList();
      String queryLogFilename = DrillTestDefaults.DRILL_OUTPUT_DIR + "/queryLog.log";
      List<String> skippedTests = Lists.newArrayList();
      File queryFile = new File(queryLogFilename);
      if (cmdParam.repeatRun == true) {
        // check if file has list of tests
        if (queryFile.length() > 0) {
          // generate a new list of tests in the requested order
          try {
            BufferedReader reader = new BufferedReader(new FileReader(queryFile));
            boolean found = false;
            String line = "";
            while ((line = reader.readLine()) != null) {
              for (DrillTest test : tests) {
                // check that requested test is in the list of tests
                if (found = test.getInputFile().equals(line)) {
                  new_tests.add(test);
                  break;
                }
              }
              if (!found) {
	        skippedTests.add(line);
              }
              found = false;
            }
            reader.close();
            tests = new_tests;
          } catch (Exception e) {
            LOG.error("\nCould not open queryFile " + queryLogFilename + " containing tests to run");
            LOG.error(e.getMessage());
            System.exit(-1);
          }
        } else {
          // file with list of tests does not exist.  create new file and
          // record the tests and the order in which they are run
          try {
            BufferedWriter writer = new BufferedWriter(new FileWriter(queryFile));
            if (writer != null) {
              for (DrillTest test : tests) {
                writer.write (test.getInputFile() + "\n");
              }
              writer.close();
            }
          } catch (Exception e) {
            LOG.error("\nCould not create queryFile " + queryLogFilename + " to record which tests are run");
            LOG.error(e.getMessage());
            System.exit(-1);
          }
        }
      }

      LOG.info("\n"+DrillTestDefaults.LINE_BREAK+"\nRUNNING TESTS - ITERATION " + i + " (of "+ cmdParam.iterations + ")\n"+DrillTestDefaults.LINE_BREAK);
      executor.executeAll(tests);

      if (cmdParam.trackMemory) {
    	  queryMemoryUsage();
      }
      for (DrillTest test : tests) {
        TestStatus testStatus = test.getTestStatus();
        if(testStatus!=TestStatus.PASS && testStatus!=TestStatus.CANCELED && cmdParam.skipRandom!=true){
 	    failingTests.add(test);
	}
	switch (testStatus) {
         case PASS:
           passingTests.add(test);
           break;
         case DATA_VERIFICATION_FAILURE:
           dataVerificationFailures.add(test);
           break;
         case PLAN_VERIFICATION_FAILURE:
           planVerificationFailures.add(test);
           break;
         case EXECUTION_FAILURE:
           executionFailures.add(test);
           break;
         case TIMEOUT:
           timeoutFailures.add(test);
           break;
         case CANCELED:
           canceledTests.add(test);
           break;
         default:
           executionFailures.add(test);
        }
      }

      /* Run all failed tests a second time.
       * Tests which succeed are categorized as random failures.
       * To prevent long runtimes, cmdParam.threads is chosen as an arbitrary max limit.
       * If total failed tests are higher than the max defined above, we do not isolate random failures.
       */ 
      if(failingTests.size() > 0 && failingTests.size() <= cmdParam.threads){
        LOG.info(DrillTestDefaults.LINE_BREAK+"\nISOLATING RANDOM FAILURES - Execution attempt 2 (of 2)\n"+DrillTestDefaults.LINE_BREAK);
        executor.executeAll(failingTests);
	for(DrillTest test : failingTests){
	  TestStatus testStatus = test.getTestStatus();         
          if(testStatus==TestStatus.PASS){
            randomFailures.add(test);
          }
	}
      }
      
      if(randomFailures.size()>0){
        for (DrillTest test : randomFailures) {
	  if(executionFailures.contains(test)){
	    executionFailures.remove(test);
	  }
	  else if(dataVerificationFailures.contains(test)){
	    dataVerificationFailures.remove(test);
	  }
	  else if(planVerificationFailures.contains(test)){
	    planVerificationFailures.remove(test);
	  }
	  else if(timeoutFailures.contains(test)){
	    timeoutFailures.remove(test);
	  }
        }
      }

      if(executionFailures.size()>0 || dataVerificationFailures.size()>0 || planVerificationFailures.size()>0 || timeoutFailures.size()>0) {
        LOG.info("\n"+DrillTestDefaults.LINE_BREAK+"\nITERATION FAILURES\n"+DrillTestDefaults.LINE_BREAK);
      }

      if(executionFailures.size()>0){
        LOG.info("\nExecution Failures:\n");
        for (DrillTest test : executionFailures) {
          LOG.info("Query: " + test.getInputFile() + "\n" + test.getQuery());
          LOG.info("\nException:\n", test.getException());
	  String [] localMsgArray = test.getException().getLocalizedMessage().split(":");
	  String localMsg = test.getException().getLocalizedMessage();
	  if(localMsgArray.length > 0){
            if(exceptionMessageSet.containsKey(localMsgArray[0]))
	      exceptionMessageSet.put(localMsgArray[0],exceptionMessageSet.get(localMsgArray[0])+1);
	    else
	      exceptionMessageSet.put(localMsgArray[0],1);
	  }
          boolean regexFound = false;
          for(String regexStr : DrillTestDefaults.DRILL_EXCEPTION_REGEXES){
             if(Utils.matches(localMsg,regexStr)){
	       regexFound = true;
	       int index = Arrays.asList(DrillTestDefaults.DRILL_EXCEPTION_REGEXES).indexOf(regexStr);
	       if(executionFailureExceptions.size()==0){
                 List newList = new ArrayList<DrillTest>();
                 newList.add(test);
                 executionFailureExceptions.add(newList);
               }
	       else if(executionFailureExceptions.get(index)==null){
                 List listAtIndex = new ArrayList<DrillTest>();
                 listAtIndex.add(test);
                 executionFailureExceptions.set(index,listAtIndex);
               } 
	       else{
                 List listAtIndex = executionFailureExceptions.get(index);
                 listAtIndex.add(test);
	       	 executionFailureExceptions.set(index,listAtIndex);
               }
	       break;
	     }

          }
	if(regexFound == false){
          List newList = executionFailureExceptions.get(DrillTestDefaults.DRILL_EXCEPTION_REGEXES.length-1);
          newList.add(test);
          executionFailureExceptions.set(DrillTestDefaults.DRILL_EXCEPTION_REGEXES.length-1,newList);
        }
        }
      }

      if(dataVerificationFailures.size()>0) {
        LOG.info("\nData Verification Failures:\n");
        for (DrillTest test : dataVerificationFailures) {
          LOG.info("Query: " + test.getInputFile()+ "\n" + test.getQuery());
          LOG.info("\nBaseline: "+ test.getExpectedFile());
          LOG.info(test.getException().getMessage());
        }
      }

      if(planVerificationFailures.size()>0) {
        LOG.info("\nPlan Verification Failures:\n");
        for (DrillTest test : planVerificationFailures) {
          LOG.info("Query: " + test.getInputFile()+ "\n" + test.getQuery());
          LOG.info("\nBaseline: "+ test.getExpectedFile());
          LOG.info(test.getException().getMessage());
        }
      }

      if(timeoutFailures.size()>0) {
        LOG.info("\nTimeout Failures:\n");
        for (DrillTest test : timeoutFailures) {
          LOG.info("Query: " + test.getInputFile() + "\n" + test.getQuery());
          LOG.info("Timed out\n");
        }
      }

      if(randomFailures.size()>0){
        LOG.info("\nRandom Failures:\n");
        for (DrillTest test : randomFailures) {
          LOG.info("Query: " + test.getInputFile() + "\n" + test.getQuery());
          LOG.info("\nException:\n", test.getException());
        }
      }

      if(skippedTests.size() > 0) {
        LOG.info("\nSkipped Tests:\n> These tests cannot be run from " + queryLogFilename + "\n");
        for (String line : skippedTests) {
          LOG.info(line);
        }
      }

      if(executionFailures.size()>0 || dataVerificationFailures.size()>0 || planVerificationFailures.size()>0 || timeoutFailures.size()>0 || randomFailures.size()>0) {
        LOG.info("\n"+DrillTestDefaults.LINE_BREAK+"\nITERATION RESULTS\n"+DrillTestDefaults.LINE_BREAK);
      }

      if(executionFailures.size()>0){
      	LOG.info("Execution Failures:\n");
	if(executionFailureExceptions != null){
          for (int ii=0;ii<executionFailureExceptions.size();ii++){
            if(executionFailureExceptions==null || executionFailureExceptions.get(ii)==null){
            }    
            else if(executionFailureExceptions.get(ii)!=null && executionFailureExceptions.get(ii).size()!=0){
              if(ii<DrillTestDefaults.DRILL_EXCEPTION.VALIDATION_ERROR_INVALID_SCHEMA.values().length){
                if(ii==0)
                  LOG.info("CATEGORY - "+DrillTestDefaults.DRILL_EXCEPTION.VALIDATION_ERROR_INVALID_SCHEMA.values()[ii]+" ("+executionFailureExceptions.get(ii).size()+")");
                else if(ii<executionFailureExceptions.size()-1)
                  LOG.info("\nCATEGORY - "+DrillTestDefaults.DRILL_EXCEPTION.VALIDATION_ERROR_INVALID_SCHEMA.values()[ii]+" ("+executionFailureExceptions.get(ii).size()+")");
                else
                  LOG.info("\n"+DrillTestDefaults.DRILL_EXCEPTION.VALIDATION_ERROR_INVALID_SCHEMA.values()[ii]+" ("+executionFailureExceptions.get(ii).size()+")");  
              }
              else{ 
                if(ii==0)
                  LOG.info("UNCATEGORIZED "+(ii-DrillTestDefaults.DRILL_EXCEPTION.VALIDATION_ERROR_INVALID_SCHEMA.values().length+1)+"("+executionFailureExceptions.get(ii).size()+")");
                else
                  LOG.info("\nUNCATEGORIZED "+(ii-DrillTestDefaults.DRILL_EXCEPTION.VALIDATION_ERROR_INVALID_SCHEMA.values().length+1)+"("+executionFailureExceptions.get(ii).size()+")");
              }
              for(DrillTest t:executionFailureExceptions.get(ii)){
                LOG.info(t.getInputFile());
              }    
            }    
          }    
        }
      }

      if(dataVerificationFailures.size()>0){
      	LOG.info("\nData Verification Failures:\n");
        for (DrillTest test : dataVerificationFailures) {
          LOG.info(test.getInputFile());
        }
      }

      if(planVerificationFailures.size()>0){
      	LOG.info("\nPlan Verification Failures:\n");
        for (DrillTest test : planVerificationFailures) {
          LOG.info(test.getInputFile());
        }
      }

      if(timeoutFailures.size()>0){
      	LOG.info("\nTimeouts:\n");
        for (DrillTest test : timeoutFailures) {
          LOG.info(test.getInputFile());
        }
      }

      if(randomFailures.size()>0){
      	LOG.info("\nRandom Failures:\n");
        for (DrillTest test : randomFailures) {
          LOG.info(test.getInputFile());
        }
      }

      // Special handling for repeated runs
      if ((cmdParam.repeatRun == true) && (queryFile.length() > 0)) {
        LOG.info("Executed queries from " + queryFile);
      }

      // Special handling for running tests tagged as failed
      if(cmdParam.runFailed == true){
        if(passingTests.size()>0){
          LOG.info("\nPassing Tests:\n");
          for (DrillTest test : passingTests) {
            LOG.info(test.getInputFile());
          }
        }

        if(executionFailures.size()>0) {
          LOG.info("\nExecution Failures (invalid tests):\n");
          for (DrillTest test : executionFailures) {
            if (test.getExpectedFile() == "") {
              LOG.info(test.getInputFile());
            }
          }
        }
      }
      LOG.info("\n"+DrillTestDefaults.LINE_BREAK+"\n");
      LOG.info(DrillTestDefaults.LINE_BREAK+"\nITERATION SUMMARY\n"+DrillTestDefaults.LINE_BREAK);
      LOG.info("Total Tests                  : " + (countTotalTests*cmdParam.clones));
      LOG.info("Passing Tests                : " + passingTests.size());
      LOG.info("Failing Tests                : " + (executionFailures.size() + dataVerificationFailures.size() + planVerificationFailures.size() + timeoutFailures.size())+"\n");
      LOG.info("> Execution Failures         : " + executionFailures.size());
      LOG.info("> Data Verification Failures : " + dataVerificationFailures.size());
      LOG.info("> Plan Verification Failures : " + planVerificationFailures.size());
      LOG.info("> Timeout Failures           : " + timeoutFailures.size());

      if(randomFailures.size() > 0)
        LOG.info("\n> Random Failures            : " + randomFailures.size());

      if(canceledTests.size() > 0)
        LOG.info("\n> Canceled Tests             : " + canceledTests.size());

      if(skippedTests.size() > 0) {
        LOG.info("\n> Skipped tests              : " + skippedTests.size());
      }

      LOG.info("\nIteration " + i + " (of " + cmdParam.iterations + ") duration: " + stopwatch);

      if (cmdParam.trackMemory) {
        LOG.info(DrillTestDefaults.LINE_BREAK+"\n"+String.format("\nMemory Consumption:\n\t\theap(M)\t\tdirect(M)\tjvm_direct(M)\n" +
                        "  before:\t%d\t\t%d\t\t%d\n  after:\t%d\t\t%d\t\t%d", memUsage[0][0], memUsage[0][1], memUsage[0][2],
                        memUsage[1][0], memUsage[1][1], memUsage[1][2])+"\n"+DrillTestDefaults.LINE_BREAK);
      }

      if(cmdParam.generateReports) {
        LOG.info(DrillTestDefaults.LINE_BREAK+"\nGENERATING REPORT\n"+DrillTestDefaults.LINE_BREAK);
        generateReports(tests, i);
      }

      totalPassingTests += passingTests.size();
      totalExecutionFailures += executionFailures.size();
      totalDataVerificationFailures += dataVerificationFailures.size();
      totalPlanVerificationFailures += planVerificationFailures.size();
      totalTimeoutFailures += timeoutFailures.size();
      totalRandomFailures += randomFailures.size();
      totalCancelledFailures += canceledTests.size();
      finalRandomFailures.addAll(randomFailures);
      finalExecutionFailures.addAll(executionFailures);
      finalDataVerificationFailures.addAll(dataVerificationFailures);
      finalPlanVerificationFailures.addAll(planVerificationFailures);
      finalTimeoutFailures.addAll(timeoutFailures);
    }
      
    if (cmdParam.iterations > 1) {
      LOG.info(DrillTestDefaults.LINE_BREAK+"\n"+String.format("\nCompleted %d iterations.\n  Passing tests: %d \n  Random failures: %d \n" +
          "  Execution Failures: %d\n  Data Verification Failures: %d\n  Plan Verification Failures: %d" +
          "\n  Timeouts: %d\n  Canceled: %d", i-1, totalPassingTests, totalRandomFailures,totalExecutionFailures,
          totalDataVerificationFailures, totalPlanVerificationFailures, totalTimeoutFailures, totalCancelledFailures));
        if(finalRandomFailures.size()>0){
      	  LOG.info(DrillTestDefaults.LINE_BREAK+"\nRandom Failures:");
      	  for(DrillTest test : finalRandomFailures){
      	    LOG.info(test.getInputFile());
      	  }
      	}
      	if(finalExecutionFailures.size()>0){
          LOG.info(DrillTestDefaults.LINE_BREAK+"\nExecution Failures:");
      	  for (DrillTest test : finalExecutionFailures) {
      	    if(test.getExpectedFile()!=""){
              LOG.info(test.getInputFile());
            }
	  }
	  if(cmdParam.runFailed == true){
	    LOG.info("Execution Failures with name errors:");
      	  }
	  for (DrillTest test : finalExecutionFailures) {
      	    if(test.getExpectedFile()==""){
              LOG.info(test.getInputFile());
            }
	  }
      	}
      	if(finalDataVerificationFailures.size()>0){
      	  LOG.info(DrillTestDefaults.LINE_BREAK+"\nData Verification Failures");
      	    for(DrillTest test : finalDataVerificationFailures){
      	      LOG.info(test.getInputFile());
      	    }
      	}
      	if(finalPlanVerificationFailures.size()>0){
      	  LOG.info(DrillTestDefaults.LINE_BREAK+"\nPlan Verification Failures");
      	    for(DrillTest test : finalPlanVerificationFailures){
      	      LOG.info(test.getInputFile());
      	    }
      	}
      	if(finalCancelledFailures.size()>0){
      	  LOG.info(DrillTestDefaults.LINE_BREAK+"\nCancelled Failures");
      	  for(DrillTest test : finalCancelledFailures){
      	    LOG.info(test.getInputFile());
      	  }
      	}
      	if(finalTimeoutFailures.size()>0){
      	  LOG.info(DrillTestDefaults.LINE_BREAK+"\nTimeout Failures");
      	  for(DrillTest test : finalTimeoutFailures){
      	    LOG.info(test.getInputFile());
      	  }
      	}
    }
    
    LOG.info(DrillTestDefaults.LINE_BREAK+"\n");
    LOG.info(DrillTestDefaults.LINE_BREAK+"\nTEARDOWN\n"+DrillTestDefaults.LINE_BREAK);
    teardown();

    executor.close();
    connectionPool.close();
    restartDrill();
    return totalExecutionFailures + totalDataVerificationFailures + totalPlanVerificationFailures + totalTimeoutFailures + totalRandomFailures;
  }

  public void setup() throws IOException, InterruptedException, URISyntaxException {
    if (!new File(DrillTestDefaults.DRILL_OUTPUT_DIR).exists()) {
      new File(DrillTestDefaults.DRILL_OUTPUT_DIR).mkdir();
    }

    LOG.info("> Uploading storage plugins");
    String templatePath = DrillTestDefaults.TEST_ROOT_DIR + "/conf/plugin-templates/common/";
    Utils.updateDrillStoragePlugins(templatePath);

    if (DrillTestDefaults.IS_SECURE_CLUSTER) {
      templatePath = DrillTestDefaults.TEST_ROOT_DIR + "/conf/plugin-templates/secure/";
    } else {
      templatePath = DrillTestDefaults.TEST_ROOT_DIR + "/conf/plugin-templates/unsecure/";
    }
    Utils.updateDrillStoragePlugins(templatePath);

    String beforeRunQueryFilename = DrillTestDefaults.TEST_ROOT_DIR + "/" + cmdParam.beforeRunQueryFilename;
    LOG.info("\n> Executing init queries\n");
    LOG.info(">> Path: " + beforeRunQueryFilename + "\n");
    try {
      String[] setupQueries = Utils.getSqlStatements(beforeRunQueryFilename);
      connection = connectionPool.getOrCreateConnection();
      for (String query : setupQueries) {
        LOG.info(">> Query: " + query + ";");
        ResultSet resultSet = Utils.execSQL(query, connection);
        if (resultSet != null) {
          LOG.info(Utils.getSqlResult(resultSet));
        }
      }

      // Initializing variables for reporting
      String getCommitId = "SELECT version, commit_id from sys.version";
      ResultSet resultSet = Utils.execSQL(getCommitId, connection);
      while (resultSet.next()) {
        commitId = resultSet.getString("commit_id");
        version = resultSet.getString("version");
      }
      
      // Setup injection map
      for (int i = 0; i < injectionKeys.length; i++) {
    	switch (injectionKeys[i]) {
    	case "DRILL_VERSION":
    	  injections.put(injectionKeys[i], version);
    	  break;
    	default:
    	  LOG.fatal("Injection parameter not recognized!");
    	}    	
      }
      connectionPool.releaseConnection(connection);
    } catch (IOException e) {
      LOG.warn("[WARNING] " + beforeRunQueryFilename + " file does not exist.\n");
    } catch (SQLException e) {
		e.printStackTrace();
		try {
			connection.close();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	}
    Thread.sleep(1000);
  }
  
  private void teardown() {
	String afterRunQueryFilename = DrillTestDefaults.TEST_ROOT_DIR + "/" + cmdParam.afterRunQueryFilename;
  LOG.info("> Executing queries\n");
  LOG.info(">> Path: " + afterRunQueryFilename + "\n");
	try {
	  connection = connectionPool.getOrCreateConnection();
	  String[] teardownQueries = Utils.getSqlStatements(afterRunQueryFilename);
      for (String query : teardownQueries) {
        LOG.info(">> Query: " + query + ";");
        ResultSet resultSet = Utils.execSQL(query, connection);
        if(resultSet != null) {
          LOG.info(Utils.getSqlResult(resultSet));
        }
      }
      LOG.info(DrillTestDefaults.LINE_BREAK);
    } catch (IOException e) {
      LOG.warn("[WARNING] " + afterRunQueryFilename + " file does not exist.\n");
    } catch (SQLException e) {
		e.printStackTrace();
		try {
			connection.close();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	} 
	connectionPool.releaseConnection(connection);

    // Stop Apache Minio server if it was started
    if(cmdParam.excludeDependencies == null || !cmdParam.excludeDependencies.contains("s3minio")) {
      Utils.stopMinio();
    }
  }

  private void prepareData(List<DrillTestCase> tests) throws Exception {
    Set<DataSource> dataSources = new HashSet<>();
    for (TestCaseModeler test : tests) {
      List<DataSource> dataSourceList = test.datasources;
      if (dataSourceList != null) {
        dataSources.addAll(test.datasources);
      }
    }

    boolean restartDrillbits = false;

    CancelingExecutor copyExecutor = new CancelingExecutor(cmdParam.threads, Integer.MAX_VALUE);
    CancelingExecutor genExecutor = new CancelingExecutor(cmdParam.threads, Integer.MAX_VALUE);
    List<Cancelable> copyTasks = Lists.newArrayList();
    List<Cancelable> genTasks = Lists.newArrayList();
    for (final TestCaseModeler.DataSource datasource : dataSources) {
      String mode = datasource.mode;
      if (mode.equals("cp")) {
        Cancelable task = new Cancelable() {
          @Override
          public void cancel() {
            // no op, as this will not time out
          }

          @Override
          public void run() {
            try {
              Path src = new Path(DrillTestDefaults.TEST_ROOT_DIR + "/" + DrillTestDefaults.DRILL_TESTDATA_DIR + "/" + datasource.src);
              Path dest = new Path(DrillTestDefaults.DRILL_TESTDATA, datasource.dest);
              dfsCopy(src, dest, DrillTestDefaults.FS_MODE);
            } catch (IOException e) {
              throw new RuntimeException(e);
            }
          }
        };
        copyTasks.add(task);
      } else if (mode.equals("gen")) {
        Cancelable task = new Cancelable() {
          @Override
          public void cancel() {
            // no op, as this will not time out
          }

          @Override
          public void run() {
            runGenerateScript(datasource);
          }
        };
        genTasks.add(task);
      } else if (mode.equals("restart-drill")) {
        restartDrillbits = true;
      }
    }

    final Stopwatch stopwatch = Stopwatch.createStarted();
    
    LOG.info("> Copying Data");
    copyExecutor.executeAll(copyTasks);
    copyExecutor.close();
    LOG.info(">> Copy duration: " + stopwatch + "\n");
    stopwatch.reset().start();
    LOG.info("> Generating Data");
    genExecutor.executeAll(genTasks);
    genExecutor.close();
    LOG.info("\n>> Generation duration: " + stopwatch + "\n");

    if (restartDrillbits) {
      restartDrill();
    }
  }

  private void dfsCopy(Path src, Path dest, String fsMode)
          throws IOException {

    FileSystem fs;
    FileSystem localFs = FileSystem.getLocal(conf);

    if (fsMode.equals("distributedFS")) {
        fs = FileSystem.get(conf);
    } else {
        fs = FileSystem.getLocal(conf);
    }

    try {
      if (localFs.getFileStatus(src).isDirectory()) {
        for (FileStatus file : localFs.listStatus(src)) {
          Path srcChild = file.getPath();
          Path newDest = new Path(dest + "/" + srcChild.getName());
          dfsCopy(srcChild, newDest, fsMode);
        }
      } else {
        if (!fs.exists(dest.getParent())) {
          fs.mkdirs(dest.getParent());
        }
        if (!fs.exists(dest)) {
          FileUtil.copy(localFs, src, fs, dest, false, fs.getConf());
          LOG.debug("Copying file " + src + " to " + dest);
        } else {
          LOG.debug("File " + src + " already exists as " + dest);
        }
      }
    } catch (FileAlreadyExistsException e) {
      LOG.debug("File " + src + " already exists as " + dest);
    } catch (IOException e) {
      LOG.debug("File " + src + " already exists as " + dest);
    }
  }

  private void runGenerateScript(DataSource datasource) {
	String command = DrillTestDefaults.TEST_ROOT_DIR + "/" + DrillTestDefaults.DRILL_TESTDATA_DIR + "/" + datasource.src;
	LOG.info("Running command " + command);
	CmdConsOut cmdConsOut;
	try {
	  cmdConsOut = Utils.execCmd(command);
	  LOG.debug(cmdConsOut);
	} catch (Exception e) {
	  cmdConsOut = new CmdConsOut();
	  cmdConsOut.cmd = command;
	  cmdConsOut.consoleErr = e.getMessage();
	  LOG.error("Error: Failed to execute the command " + cmdConsOut);
	  throw new RuntimeException(e);
	}
	if (cmdConsOut.exitCode != 0) {
	  throw new RuntimeException("Error executing the command " + command
	          + " has return code " + cmdConsOut.exitCode);
	}
  }
  
  private DrillTest getDrillTest(DrillTestCase modeler, ConnectionPool connectionPool, int cloneId, int totalCases) {
    switch(modeler.submitType) {
    case "jdbc":
      return new DrillTestJdbc(modeler, connectionPool, cloneId, totalCases);
    case "odbc":
      return new DrillTestOdbc(modeler, cloneId, totalCases);
    case "script":
      return new DrillTestScript(modeler, cloneId);
    case "system":
      return null;
    default:
      throw new UnsupportedOperationException("Unknown query type: " + modeler.queryType);
    }
  }
  
  private void queryMemoryUsage() throws IOException, SQLException {
	String query = "select sum(heap_current) as heap_current, sum(direct_current) as direct_current, " +
			"sum(jvm_direct_current) as jvm_direct_current from sys.memory";

	if (memUsageFilename == null) {
	  memUsageFilename = Utils.generateOutputFileName(DrillTestDefaults.TEST_ROOT_DIR, "/memComsumption", false);
	}
    BufferedWriter writer = new BufferedWriter(new FileWriter(new File(memUsageFilename), true));
    ResultSet resultSet = null;
    try {
      connection = connectionPool.getOrCreateConnection();
      resultSet = Utils.execSQL(query, connection);

      List columnLabels = new ArrayList<String>();
      int columnCount = resultSet != null ? resultSet.getMetaData().getColumnCount() : 0;
      for (int i = 1; i <= columnCount; i++) {
        columnLabels.add(resultSet.getMetaData().getColumnLabel(i));
      }
      List<Integer> types = Lists.newArrayList();
      for (int i = 1; i <= columnCount; i++) {
        types.add(resultSet.getMetaData().getColumnType(i));
      }

      LOG.debug("Result set data types:");
      LOG.debug(Utils.getTypesInStrings(types));

      if (resultSet != null) {
        while (resultSet.next()) {
          List<Object> values = Utils.getRowValues(resultSet);
          ColumnList columnList = new ColumnList(types, values);
          writer.write(columnList + "\n");
          for (int i = 0; i < 3; i++) {
            memUsage[0][i] = memUsage[1][i];
            memUsage[1][i] = (Long) values.get(i) / 1024 / 1024;
          }
        }
      }
      connectionPool.releaseConnection(connection);
    } catch (IllegalArgumentException | IllegalAccessException e1) {
	  e1.printStackTrace();
    } catch (IOException e1) {
	  e1.printStackTrace();
    } catch (SQLException e1) {
      LOG.warn(e1.getMessage());
      e1.printStackTrace();
      connection.close();
    } finally {
      if (resultSet != null) {
        resultSet.close();
      }
      if (writer != null) {
        writer.close();
      }
    }
  }

  private void generateReports(List<DrillTest> tests, int iteration) {
    try{
      File drillReportDir = new File(DrillTestDefaults.DRILL_REPORTS_DIR);
      FileSystem localFS = FileSystem.getLocal(conf);
      FileSystem DFS = FileSystem.get(conf);

      if (!drillReportDir.exists()) {
        if (!drillReportDir.mkdir()) {
          LOG.debug("Cannot create directory " + DrillTestDefaults.DRILL_REPORTS_DIR
                  + ".  Using current working directory for drill output");
          DrillTestDefaults.DRILL_REPORTS_DIR = DrillTestDefaults.TEST_ROOT_DIR;
        }
      }

      File reportFile = new File(DrillTestDefaults.DRILL_REPORTS_DIR + "/apache-drill-" + version + "_" + commitId + "_" +
              "report_" + new Date().toString().replace(' ', '_').replace(':','_') + ".json");

      BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(reportFile));
      Document document;
      for (DrillTest test : tests) {
        document = Json.newDocument();
        document.set("_id", test.getTestId()+ "_" + new File(test.getInputFile()).getName() + "_" 
        		+ test.getCloneId() + "_" + iteration);
        document.set("queryFilepath", test.getInputFile().substring(test.getInputFile().indexOf("resources/")+10));
        String query = test.getQuery();
        if(query != null){
          query.replaceAll("\n", "");
        }
        document.set("query", query);
        document.set("status", test.getTestStatus().toString());
        if(test.getTestStatus().equals(TestStatus.EXECUTION_FAILURE) 
        		|| test.getTestStatus().equals(TestStatus.DATA_VERIFICATION_FAILURE)
        		|| test.getTestStatus().equals(TestStatus.PLAN_VERIFICATION_FAILURE)) {
          document.set("errorMessage", test.getException().toString().replaceAll("\n",""));
        }else{
          document.set("errorMessage", "N/A");
        }
        document.set("queryExecutionTime", test.getDuration().toString());
        document.set("drillVersion", version);
        document.set("commitId", commitId);
        bufferedWriter.write(document.toString());
        bufferedWriter.newLine();
      }

      bufferedWriter.flush();
      bufferedWriter.close();

      // Upload report to DFS if the DRILL_REPORTS_DFS_DIR variable is set
      if (!DrillTestDefaults.DRILL_REPORTS_DFS_DIR.isEmpty()){
        FileUtil.copy(localFS, new Path(reportFile.getAbsolutePath()), DFS, 
        		new Path (DrillTestDefaults.DRILL_REPORTS_DFS_DIR + "/" + reportFile.getName()), true, false, DFS.getConf());
      }
    }
    catch(Exception e){
      e.printStackTrace();
    }
  }
  
  private int restartDrill() {
    int exitCode = 0;
    String command = DrillTestDefaults.TEST_ROOT_DIR + "/" + DrillTestDefaults.RESTART_DRILL_SCRIPT;
    File commandFile = new File(command);
    if (commandFile.exists() && commandFile.canExecute()) {
      LOG.info("\n> Executing Post Build Script");
      LOG.info("\n>> Path: " + command);
      exitCode = Utils.execCmd(command).exitCode;
      if (exitCode != 0) {
        LOG.error("\n>> Error restarting drillbits");
      }
    }
    return exitCode;
  }
}
