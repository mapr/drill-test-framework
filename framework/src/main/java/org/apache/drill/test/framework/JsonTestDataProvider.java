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

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.fasterxml.jackson.core.JsonParseException;
import org.apache.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Data provider for all drill tests.
 * 
 * 
 */
public class JsonTestDataProvider {
  private static final Logger LOG = Logger.getLogger(JsonTestDataProvider.class);

  /**
   * Constructs an iteration of test case definitions from various test data
   * sources, obtained from the mvn command line option. See README.md for more
   * details.
   * 
   * @return an iteration of object arrays that defines the set of tests to be
   *         executed.
   * @throws Exception
   */
  public static List<TestCaseModeler> getData() throws IOException {
    String[] testDefSources = null;
    try {
      testDefSources = TestDriver.OPTIONS.sources.split(",");
    } catch (Exception e) {
      testDefSources = new String[] { "" };
    }
    String[] testGroups = null;
    try {
      testGroups = TestDriver.OPTIONS.groups.split(",");
    } catch (Exception e) {
      LOG.info("Test groups not specified.  Will run all collected tests.");
    }
    List<TestCaseModeler> data = new ArrayList<>();
    for (String testDefSource : testDefSources) {
      testDefSource = Utils.getAbsolutePath(testDefSource, "DRILL_TEST_DATA_DIR");
      File testDefSourceFile = new File(testDefSource);
      List<File> testDefFiles = searchFiles(testDefSourceFile, ".*.json");
      for (File testDefFile : testDefFiles) {
//        try {
        TestCaseModeler modeler;
        try {
          modeler = getTestCaseModeler(testDefFile
              .getAbsolutePath());
        } catch (JsonParseException e) {
          LOG.warn("Caught exception parsing " + testDefFile + ". This test will not be executed.", e);
          continue;
        }
        List<String> categories = modeler.categories;
        boolean foundTests = false;
        for (String testGroup : testGroups) {
          if (categories != null && !categories.contains(testGroup)) {
            continue;
          } else {
            foundTests = true;
            break;
          }
        }
        if (!foundTests) {
          continue;
        }
        String queryFileExtension = modeler.matrices.get(0).inputFile;
        String expectedFileExtension = modeler.matrices.get(0).expectedFile;
        boolean skipSuite = false;
        if (modeler.dependencies != null) {
         for (String dependency : modeler.dependencies) {
           if (TestDriver.OPTIONS.excludeDependenciesAsList().contains(dependency)) {
             skipSuite = true;
           }
         }
        }
        if (skipSuite) {
          continue;
        }
          List<File> testQueryFiles = searchFiles(testDefFile.getParentFile(),
                  queryFileExtension);
          for (File testQueryFile : testQueryFiles) {
            String expectedFileName = getExpectedFile(
                    testQueryFile.getAbsolutePath(), queryFileExtension,
                    expectedFileExtension);
            TestCaseModeler.TestMatrix testMatrix = TestCaseModeler.TestMatrix
                    .createTestMatrix(testQueryFile.getAbsolutePath(),
                            modeler.matrices.get(0).schema,
                            modeler.matrices.get(0).outputFormat, expectedFileName,
                            modeler.matrices.get(0).username,
                            modeler.matrices.get(0).password,
                            modeler.matrices.get(0).verificationTypes);
            List<TestCaseModeler.TestMatrix> testMatrices = new ArrayList<TestCaseModeler.TestMatrix>();
            testMatrices.add(testMatrix);
            data.add(TestCaseModeler.createTestCase(
                    modeler.testId, modeler.type, modeler.negative,
                    modeler.description, modeler.submitType, modeler.queryType,
                    modeler.timeout, categories, modeler.dependencies, testMatrices, modeler.datasources));
          }

//        } catch (Exception e) {
//          LOG.error("Exception while parsing " + testDefSource, e);
//        }
      }
    }
    if (data.size() == 0) {
      LOG.warn("Warning: No test cases have been collected.");
    }
    return data;
  }

  private static TestCaseModeler getTestCaseModeler(String testDefFile)
      throws IOException {
    byte[] jsonData = Files.readAllBytes(Paths.get(testDefFile));
    ObjectMapper objectMapper = new ObjectMapper();
    return objectMapper.readValue(new String(jsonData), TestCaseModeler.class);
  }

  private static List<File> searchFiles(File root, String regex) {
    List<File> list = new ArrayList<File>();
    Pattern pattern = Pattern.compile(regex + "$");
    Matcher matcher = null;
    if (root.isFile()) {
      matcher = pattern.matcher(root.getName());
      if (matcher.find()) {
        list.add(root);
        return list;
      }
    } else {
      for (File file : root.listFiles()) {
        if (!file.getName().equals("datasources")) {
          list.addAll(searchFiles(file, regex));
        }
      }
    }
    return list;
  }

  private static String getExpectedFile(String queryFile, String queryFileExt,
      String expectedFileExt) {
    int idx = queryFile.indexOf(queryFileExt.substring(2));
    return queryFile.substring(0, idx).concat(expectedFileExt.substring(2));
  }
}
