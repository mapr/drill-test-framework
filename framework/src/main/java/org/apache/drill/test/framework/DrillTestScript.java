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
import org.apache.commons.io.FileUtils;
import org.apache.drill.test.framework.TestCaseModeler.TestMatrix;
import org.apache.drill.test.framework.TestVerifier.TestStatus;
import org.apache.drill.test.framework.TestVerifier.PlanVerificationException;
import org.apache.drill.test.framework.TestVerifier.VerificationException;
import org.apache.drill.test.framework.TestVerifier.ExecutionException;
import org.apache.log4j.Logger;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
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
import java.util.concurrent.TimeUnit;


public class DrillTestScript implements DrillTest {
  private static final Logger LOG = Logger.getLogger("DrillTestLogger");
  private String query;
  private String outputFilename;
  private volatile TestStatus testStatus = TestStatus.PENDING;
  private Exception exception;
  private TestVerifier testVerifier;
  private DrillTestCase modeler;
  private Stopwatch duration;
  private Thread thread;
  private int id;
  private TestMatrix matrix;
  private boolean checkLogs = false;

  public DrillTestScript(DrillTestCase modeler, int id) {
	this.id = id;
    this.modeler = modeler;
    this.matrix = modeler.matrices.get(0);
  }
  
 
  public void run() {
    final Stopwatch stopwatch = Stopwatch.createStarted();
    this.thread = Thread.currentThread();
    setTestStatus(TestStatus.RUNNING);
    try {
      outputFilename = Utils.generateOutputFileName(modeler.queryFilename, modeler.testId, false) + "_" + id;
    } catch (IOException e) {
      LOG.error(e.getMessage());
      throw new RuntimeException(e);
    }
  	CmdConsOut cmdConsOut = null;
/*
    String command = System.getProperty("user.dir") + "/" 
    		+ DrillTestDefaults.DRILL_TESTDATA_DIR + "/"
    		+ modeler.script + " "
    	    + modeler.queryFilename + " "
    	    + outputFilename;
*/
    String command = modeler.queryFilename;
    if (command.contains("yaml")) {
      command = "kubectl apply -f " + command + " --as user1";
      // command = "kubectl apply -f " + command;
      LOG.info("Running " + command);
      checkLogs = true;
    } else {
      LOG.info("Running test " + command);
    }
    try {

      if (checkLogs) {
        Delete(modeler.queryFilename);
        cmdConsOut = Utils.execCmd(command);
        // LOG.info(cmdConsOut);
        WaitForCompleteAndLog(modeler.queryFilename, outputFilename);
      } else {
        cmdConsOut = Utils.execCmdPB(command, outputFilename);
        // LOG.info(cmdConsOut);
      }

      if (getTestStatus()!= testStatus.CANCELED) { //Not to verify again if deliberately cancelled
        testVerifier = new TestVerifier(matrix);
        if (matrix.verificationTypes.get(0).equalsIgnoreCase("regex") ||
                matrix.verificationTypes.get(0).equalsIgnoreCase("regex-no-order") ||
                matrix.verificationTypes.get(0).equalsIgnoreCase("spark-pi") ||
                matrix.verificationTypes.get(0).equalsIgnoreCase("maprdbjson")) {
                setTestStatus(testVerifier.verifyTextPlan(modeler.expectedFilename, outputFilename));
        } else if (matrix.verificationTypes.get(0).equalsIgnoreCase("self-check")) {
                setTestStatus(testVerifier.verifyExitCode(cmdConsOut));
        } else {
                // "in-memory"
                setTestStatus(testVerifier.verifyResultSet(modeler.expectedFilename, outputFilename));
        }
      }
    } catch (VerificationException e) {
      fail(TestStatus.DATA_VERIFICATION_FAILURE, e);
    } catch (PlanVerificationException e) {
      // command = "/root/drill-test-framework/framework/resources/Functional/upgrade/collect.sh";
      // cmdConsOut = Utils.execCmd(command);
      // System.exit(1);
      // LOG.info(cmdConsOut);
      fail(TestStatus.PLAN_VERIFICATION_FAILURE, e);
    } catch (ExecutionException e) {
      fail(TestStatus.EXECUTION_FAILURE, e);
    } catch (Exception e) {
      fail(TestStatus.EXECUTION_FAILURE, e);
    } finally {
      duration = stopwatch;
      if (testStatus == TestStatus.PASS && !TestDriver.cmdParam.outputQueryResult) {
          // Utils.deleteFile(outputFilename);
      }
      LOG.info(testStatus + " (" + stopwatch + ") " + modeler.script + " " 
    		  			+ modeler.queryFilename);
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
	if (testStatus == TestStatus.CANCELED || testStatus == TestStatus.DATA_VERIFICATION_FAILURE) 
	  return;
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

  public void Delete(String queryFile)
      throws InterruptedException {
    String name = GetJobName (queryFile);
    if (CheckForJob (name)) {
      // Pod already exists.  Delete it
      String command = "kubectl delete -f " + queryFile;
      // LOG.info("Running " + command);
      CmdConsOut cmdConsOut = Utils.execCmd(command);
      // LOG.info (cmdConsOut);
      while (CheckForJob (name)) {
        Thread.sleep(10000);
      }
    }
  }

  public String GetJobName(String queryFile) {
    String command = "grep name: " + queryFile;
    CmdConsOut cmdConsOut = Utils.execCmd(command);
    String name = cmdConsOut.consoleOut.split(":")[1].trim() + "-driver";
    // LOG.info ("name is: " + name);
    return name;
  }

  public boolean CheckForJob(String jobName) {
    String command = "kubectl get pod " + jobName + " -n internaltenant";
    // LOG.info (command);
    CmdConsOut cmdConsOut = Utils.execCmdNoWarn(command);
    // LOG.info (cmdConsOut);
    if (cmdConsOut.exitCode > 0) {
      // LOG.info ("return false");
      return false;
    }
    String nameString = cmdConsOut.consoleOut.split("\n")[1];
    // LOG.info ("nameString: " + nameString);
    String name = nameString.split("\\s+")[0];
    // LOG.info ("name is: " + name);
    if (jobName.equals(name)) {
      // LOG.info ("return true");
      return true;
    } else {
      // LOG.info ("return false");
      return false;
    }
 }

  public void WaitForCompleteAndLog(String queryFile, String outputFilename)
      throws InterruptedException, IOException, ExecutionException {
    String name = GetJobName (queryFile);
    String command = "kubectl get pod " + name + " -n internaltenant";
    // LOG.info (command);
    CmdConsOut cmdConsOut = Utils.execCmdNoWarn(command);
    // LOG.info (cmdConsOut);
    while (cmdConsOut.exitCode == 1) {
      // LOG.info ("Wait for " + queryFile);
      Thread.sleep(10000);
      cmdConsOut = Utils.execCmd(command);
      // LOG.info (cmdConsOut);
    }
    String statusString = cmdConsOut.consoleOut.split("\n")[1];
    String status = statusString.split("\\s+")[2];
    // LOG.info ("status is: " + status);
    while (!status.equals("Completed") && !status.equals("Error")) {
      Thread.sleep(30000);
      command = "kubectl get pod " + name + " -n internaltenant";
      // LOG.info (command);
      cmdConsOut = Utils.execCmd(command);
      status = cmdConsOut.consoleOut.split("\n")[1].split("\\s+")[2];
      // LOG.info ("status is: " + status);
    }

    if (status.equals("Error")) {
      throw new ExecutionException ("Pod has encountered an error");
    }
    command = "kubectl logs " + name + " -n internaltenant";
    // LOG.info (command);
    cmdConsOut = Utils.execCmd(command);
    // LOG.info (cmdConsOut);

    FileUtils.write(new File(outputFilename), cmdConsOut.consoleOut);
  }
}
