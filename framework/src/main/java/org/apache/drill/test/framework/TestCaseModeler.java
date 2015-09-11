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

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * Modeler for a drill test case from test definition json file.
 * 
 * 
 */
public class TestCaseModeler {
  public String testId;
  public String type;
  public boolean negative = false;
  public String description;
  @JsonProperty("submit-type")
  public String submitType = "jdbc";
  public String queryType = "sql";
  public String timeout = null;
  public List<String> categories;
  public List<TestMatrix> matrices;
  public List<DataSource> datasources;
  public List<String> dependencies;

  public static TestCaseModeler createTestCase(String testId, String type,
      boolean negative, String description, String submitType,
      String queryType, String timeout, List<String> categories, List<String> dependencies,
      List<TestMatrix> matrices, List<DataSource> datasources) {
    TestCaseModeler testCase = new TestCaseModeler();
    testCase.testId = testId;
    testCase.type = type;
    testCase.negative = negative;
    testCase.description = description;
    testCase.submitType = submitType;
    testCase.queryType = queryType;
    testCase.timeout = timeout;
    testCase.categories = categories;
    testCase.dependencies = dependencies;
    testCase.matrices = matrices;
    testCase.datasources = datasources;
    return testCase;
  }

  public static class TestMatrix {
    @JsonProperty("query-file")
    public String inputFile;
    public String schema;
    @JsonProperty("output-format")
    public String outputFormat;
    @JsonProperty("expected-file")
    public String expectedFile;
    public String username = TestDriver.drillProperties.get("USERNAME");
    public String password = TestDriver.drillProperties.get("PASSWORD");
    @JsonProperty("verification-type")
    public List<String> verificationTypes;

    public static TestMatrix createTestMatrix(String inputFile, String schema,
        String outputFormat, String expectedFile, String username,
        String password, List<String> verificationTypes) {
      TestMatrix testMatrix = new TestMatrix();
      testMatrix.inputFile = inputFile;
      testMatrix.schema = schema;
      testMatrix.outputFormat = outputFormat;
      testMatrix.expectedFile = expectedFile;
      testMatrix.username = username;
      testMatrix.password = password;
      testMatrix.verificationTypes = verificationTypes;
      return testMatrix;
    }

    @Override
    public String toString() {
      return "Test Matrices:" + "\n\tinput-file: " + inputFile + "\n\tschema: "
          + schema + "\n\toutput-format: " + outputFormat
          + "\n\texpected-file: " + expectedFile 
          + "\n\tusername: " + username + "\n\tpassword: " + password 
          + "\n\tverification-type: "
          + verificationTypes.toString();
    }
  }

  public static class DataSource {
    public String mode;
    public String src;
    public String dest;

    public static DataSource createDataSource(String mode, String src,
        String dest) {
      DataSource dataSource = new DataSource();
      dataSource.mode = mode;
      dataSource.src = src;
      dataSource.dest = dest;
      return dataSource;
    }

    @Override
    public String toString() {
      String result = "Data Sources: " + "\n\tMode: " + mode + "\n\tSource: "
          + src;
      if (dest != null && dest.length() > 0) {
        result += "\n\tDestination: " + dest;
      }
      return result;
    }

    @Override
    public int hashCode() {
      return (mode == null ? 0 : mode.hashCode()) ^ (src == null ? 0 : src.hashCode()) ^ (dest == null ? 0 : dest.hashCode());
    }

    @Override
    public boolean equals(Object obj) {
      if (!(obj instanceof DataSource)) {
        return false;
      }
      DataSource that = (DataSource) obj;
      if (oneNull(this.mode, that.mode) || oneNull(this.src, that.src) || oneNull(this.dest, that.dest)) {
        return false;
      }
      if (!(bothNull(this.mode, that.mode) || this.mode.equals(that.mode))) {
        return false;
      }
      if (!(bothNull(this.src, that.src) || this.src.equals(that.src))) {
        return false;
      }
      if (!(bothNull(this.dest, that.dest) || this.dest.equals(that.dest))) {
        return false;
      }
      return true;
    }

    private static boolean bothNull(Object obj1, Object obj2) {
       return (obj1 == null && obj2 == null);
    }

    private static boolean oneNull(Object obj1, Object obj2) {
      return ((obj1 == null && obj2 != null) || (obj1 != null && obj2 == null));
    }
  }

  @Override
  public String toString() {
    String result = "Test Id: " + testId + "\nType: " + type
        + "\nTest Description: " + description;
    if (submitType != null) {
      result += "\nSubmit Type: " + submitType;
    }
    if (queryType != null) {
      result += "\nQuery Type: " + queryType;
    }
    if (timeout != null) {
      result += "\nTimeout: " + timeout;
    }
    result += "\nTest Categories: " + categories;
    for (TestMatrix matrix : matrices) {
      result += "\n" + matrix.toString();
    }
    if (datasources != null) {
      for (DataSource datasource : datasources) {
        result += "\n" + datasource.toString();
      }
    }
    return result;
  }
}
