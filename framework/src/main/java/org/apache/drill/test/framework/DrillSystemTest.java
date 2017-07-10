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
import org.apache.drill.test.framework.TestCaseModeler.TestMatrix;
import org.apache.drill.test.framework.TestVerifier.TestStatus;

public class DrillSystemTest implements DrillTest {
  private TestStatus testStatus = TestStatus.PENDING;
  private Exception exception;
  private TestCaseModeler modeler;
  private TestMatrix matrix;
  private String query;
  private String testId;
  private Stopwatch duration;
  private int cloneId;

  public DrillSystemTest(TestCaseModeler modeler) {
    this.modeler = modeler;
  }

  @Override
  public TestStatus getTestStatus() {
    return null;
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
  public String getExpectedFile(){
    return matrix.expectedFile;
  }

  @Override
  public String getQuery() {
    return query;
  }

  @Override
  public String getTestId() {
    return testId;
  }

  @Override
  public int getCloneId() {
    return cloneId;
  }

  @Override
  public Stopwatch getDuration() {
    return duration;
  }

  @Override
  public void cancel() {

  }

  @Override
  public void run() {

  }
}
