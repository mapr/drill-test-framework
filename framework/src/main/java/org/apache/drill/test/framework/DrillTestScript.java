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

public class DrillTestScript implements DrillTest {
  private static final Logger LOG = Logger.getLogger(DrillTestScript.class);

  private String query;
  private String outputFilename;
  private volatile TestStatus testStatus = TestStatus.PENDING;
  private Exception exception;
  private DrillTestCase modeler;
  private Stopwatch duration;
  private Thread thread;
  private int id;
  private TestMatrix matrix;

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
    String command = System.getProperty("user.dir") + "/" 
    		+ TestDriver.drillTestDataDir + "/" 
    		+ modeler.script + " "
    	    + modeler.queryFilename + " "
    	    + outputFilename;
	LOG.info("Running test " + command);
    try {

  	  cmdConsOut = Utils.execCmd(command);
  	  LOG.info(cmdConsOut.consoleOut);

      switch (cmdConsOut.exitCode) {
      case 0:
        setTestStatus(TestStatus.PASS);
        break;
      case 1:
        setTestStatus(TestStatus.EXECUTION_FAILURE);
        break;
      case 2:
        setTestStatus(TestStatus.VERIFICATION_FAILURE);
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
      fail(TestStatus.EXECUTION_FAILURE, e);
	} finally {
      duration = stopwatch;
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
	if (testStatus == TestStatus.CANCELED || testStatus == TestStatus.VERIFICATION_FAILURE) 
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
