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

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.google.common.collect.Lists;
import org.apache.log4j.Logger;

/**
 * Verification of drill tests by comparing actual query output with expected
 * query result set.
 * 
 */
public class TestVerifier {
  private static final Logger LOG = Logger.getLogger(TestVerifier.class);
  private static final int MAX_MISMATCH_SIZE = 10;
  public TestStatus testStatus = TestStatus.PENDING;
  private int mapSize = 0;
  private List<ColumnList> resultSet = null;
  private List<Integer> types;
  private String query;
  private List<String> columnLabels;
  private List<String> verificationTypes;

  public enum TestStatus {
    PENDING, RUNNING, PASS, EXECUTION_FAILURE, VERIFICATION_FAILURE, ORDER_MISMATCH, TIMEOUT,
    CANCELED
  };

  public TestVerifier(List<Integer> types, String query, List<String> columnLabels, List<String> verificationType) {
    this.types = types;
    this.query = query;
    this.columnLabels = columnLabels;
    this.verificationTypes = verificationType;
  }

  /**
   * Verifies query output from sqlline execution.
   * 
   * @param expectedOutput
   *          name of expected file
   * @param actualOutput
   *          name of actual output file
   * @param verifyOrderBy
   *          if query involves order-by
   * @return {@link TestStatus}
   * @throws Exception
   */
  public TestStatus verifySqllineResult(String expectedOutput,
      String actualOutput, boolean verifyOrderBy) throws IOException, VerificationException, IllegalAccessException {
    String cleanedUpFile = cleanUpSqllineOutputFile(actualOutput);
    return verifyResultSet(expectedOutput, cleanedUpFile, verifyOrderBy);
  }

  private String cleanUpSqllineOutputFile(String actualOutput) throws IOException {
    String cleanedUpFile = actualOutput + "_cleaned";
    BufferedReader reader = new BufferedReader(new FileReader(new File(
        actualOutput)));
    BufferedWriter writer = new BufferedWriter(new FileWriter(new File(
        cleanedUpFile)));
    String line = "";
    List<String> lines = new ArrayList<String>();
    while ((line = reader.readLine()) != null) {
      line = line.replaceAll("'", "");
      lines.add(line);
    }
    for (int i = 4; i < lines.size() - 3; i++) {
      writer.write(lines.get(i) + "\n");
    }
    writer.write(lines.get(lines.size() - 3));
    reader.close();
    writer.close();
    return cleanedUpFile;
  }

  /**
   * Verifies output of a query. The verification is performed by comparing the
   * contents of the expected and actual query result files.
   * 
   * @param expectedOutput
   *          name of file containing expected output data
   * @param actualOutput
   *          name of file containing actual output data
   * @return {@link TestStatus}
   * @throws Exception
   */
  public TestStatus verifyResultSet(String expectedOutput,
      String actualOutput) throws IllegalAccessException, IOException, VerificationException {
    return verifyResultSet(expectedOutput, actualOutput, false);
  }

  /**
   * Verifies output of a query. The verification is performed by comparing the
   * contents of the expected and actual query result files.
   * 
   * @param expectedOutput
   *          name of file containing expected output data
   * @param actualOutput
   *          name of file containing actual output data
   * @param verifyOrderBy
   *          whether the query involves order by
   * @return {@link TestStatus}
   * @throws Exception
   */
  public TestStatus verifyResultSet(String expectedOutput,
      String actualOutput, boolean verifyOrderBy) throws IOException, VerificationException, IllegalAccessException {
    if (testStatus == TestStatus.EXECUTION_FAILURE 
    	|| testStatus == TestStatus.CANCELED) {
      return testStatus;
    }
    Map<ColumnList, Integer> expectedMap = loadFromFileToMap(expectedOutput);
    if (expectedMap == null) {
      return TestStatus.EXECUTION_FAILURE;
    }

    int expectedCount = mapSize;
    Map<ColumnList, Integer> actualMap = loadFromFileToMap(actualOutput);
    int actualCount = mapSize;
    List<ColumnList> unexpectedList = new ArrayList<ColumnList>();
    int unexpectedCount = 0;
    Iterator<Map.Entry<ColumnList, Integer>> iterator = actualMap.entrySet()
        .iterator();
    while (iterator.hasNext()) {
      Map.Entry<ColumnList, Integer> entry = iterator.next();
      ColumnList cl = entry.getKey();
      int count = entry.getValue();
      while (count > 0 && check(expectedMap, cl)) {
        count--;
      }
      if (count > 0) {
        unexpectedList.add(cl);
        unexpectedCount += count;
      }
    }
    testStatus = expectedMap.isEmpty() && unexpectedList.isEmpty() ? TestStatus.PASS
        : TestStatus.VERIFICATION_FAILURE;
    if (testStatus != TestStatus.PASS) {
      throw new VerificationException(printSummary(unexpectedList, unexpectedCount, expectedMap, expectedCount,
          actualCount, verifyOrderBy));
    }
    Map<String,String> orderByColumns = getOrderByColumns(query, columnLabels);
    if (orderByColumns != null) {
      testStatus = verifyResultSetOrders(actualOutput, columnLabels, orderByColumns);
    }
    return testStatus;
  }

  private Map<ColumnList, Integer> loadFromFileToMap(String filename)
    throws IOException, VerificationException, IllegalAccessException {
    return loadFromFileToMap(filename, false);
  }

  /**
   * Loads content of a result set file into a Map object.
   * 
   * @param filename
   *          name of file containing result sets
   * @return map of result set
   * @throws Exception
   */
  private Map<ColumnList, Integer> loadFromFileToMap(String filename,
      boolean ordered) throws VerificationException, IOException, IllegalAccessException {
    if (types == null) {
      throw new VerificationException("Fatal: Types in the result set is null.  "
          + "This most likely resulted from failed execution.");
    }
    int size = types.size();
    Map<ColumnList, Integer> map = null;
    if (ordered) {
      resultSet = new ArrayList<ColumnList>();
    } else {
      map = new HashMap<ColumnList, Integer>();
    }
    BufferedReader reader = new BufferedReader(new FileReader(filename));
    String line = "";
    mapSize = 0;
    while ((line = reader.readLine()) != null) {
      String[] fields = line.split("\t", -1);
      if (fields.length != size) {
        StringBuilder sb = new StringBuilder();
        sb.append("Error: expected data and actual data have different number of columns.");
        sb.append("\nNumber of columns in expected data: " + fields.length);
        sb.append("\nNumber of columns in actual data: " + size);
        sb.append("\nFirst row of expected data:\n" + line);
        sb.append("\nTypes in actual data: " + Utils.getTypesInStrings(types));
        throw new VerificationException(sb.toString());
      }
      List<Object> typedFields = Lists.newArrayList();
      for (int i = 0; i < fields.length; i++) {
        if (types.size() == 0) {
          typedFields.add(fields[i]);
          continue;
        }
        if (fields[i].equals("null")) {
          typedFields.add(null);
          continue;
        }
        int type = (Integer) (types.get(i));
        try {
          switch (type) {
          case Types.INTEGER:
          case Types.BIGINT:
          case Types.SMALLINT:
          case Types.TINYINT:
            typedFields.add(new BigInteger(fields[i]));
            break;
          case Types.FLOAT:
            typedFields.add(new Float(fields[i]));
            break;
          case Types.DOUBLE:
            typedFields.add(new Double(fields[i]));
            break;
          case Types.DECIMAL:
            typedFields.add(new BigDecimal(fields[i]));
            break;
          default:
            typedFields.add(fields[i]);
            break;
          }
        } catch (Exception e) {
          typedFields.add(fields[i]);
        }
      }
      ColumnList cl = new ColumnList(types, typedFields);
      if (ordered) {
        resultSet.add(cl);
      } else {
        if (map.containsKey(cl)) {
          map.put(cl, map.get(cl) + 1);
        } else {
          map.put(cl, 1);
        }
        mapSize++;
      }
    }
    reader.close();
    return map;
  }

  private boolean check(Map<ColumnList, Integer> map, ColumnList entry) {
    if (map.containsKey(entry)) {
      map.put(entry, map.get(entry) - 1);
      if (map.get(entry) == 0) {
        map.remove(entry);
      }
      return true;
    }
    return false;
  }

  private String printSummary(List<ColumnList> unexpectedList,
      int unexpectedCount, Map<ColumnList, Integer> expectedMap,
      int expectedCount, int actualCount, boolean verifyOrderBy) {
    StringBuilder sb = new StringBuilder();
    if (testStatus == TestStatus.EXECUTION_FAILURE
        || testStatus == TestStatus.TIMEOUT) {
      return null;
    }
    int missingCount = getMissingCount(expectedMap);
    if (testStatus == TestStatus.PASS) {
      return null;
    }
    sb.append("         Expected number of rows: " + expectedCount);
    sb.append("\nActual number of rows from Drill: " + actualCount);
    sb.append("\n         Number of matching rows: "
        + (expectedCount - missingCount));
    sb.append("\n          Number of rows missing: " + missingCount);
    sb.append("\n       Number of rows unexpected: " + unexpectedList.size());
    int count = 0;
    if (!unexpectedList.isEmpty()) {
      sb.append("\n\nThese rows are not expected (first " + MAX_MISMATCH_SIZE
          + "):");
      for (ColumnList row : unexpectedList) {
        sb.append("\n" + row);
        count++;
        if (count == MAX_MISMATCH_SIZE) {
          break;
        }
      }
    }
    if (!expectedMap.isEmpty()) {
      sb.append("\n\nThese rows are missing (first " + MAX_MISMATCH_SIZE + "):");
      count = 0;
      for (Map.Entry<ColumnList, Integer> entry : expectedMap.entrySet()) {
        sb.append("\n" + entry.getKey() + " (" + entry.getValue() + " time(s))");
        count++;
        if (count == MAX_MISMATCH_SIZE) {
          break;
        }
      }
    }
    return sb.toString();
  }

  private static int getMissingCount(Map<ColumnList, Integer> map) {
    int missingCount = 0;
    Iterator<Integer> iterator = map.values().iterator();
    while (iterator.hasNext()) {
      missingCount += iterator.next();
    }
    return missingCount;
  }

  private static int compareTo(ColumnList list1, ColumnList list2,
      Map<Integer, String> columnIndexAndOrder, int start) {
    if (start == columnIndexAndOrder.size()) {
      return 0;
    }
    int idx = (Integer) columnIndexAndOrder.keySet().toArray()[start];
    int result = -1;
    Object o1 = list1.getValues().get(idx);
    Object o2 = list2.getValues().get(idx);
    if (ColumnList.bothNull(o1, o2)) {
      return compareTo(list1, list2, columnIndexAndOrder, start + 1);
    } else if (ColumnList.oneNull(o1, o2)) {
      return 0; // TODO handle NULLS FIRST and NULLS LAST cases
    }
    if (o1 instanceof Number) {
      Number number1 = (Number) o1;
      Number number2 = (Number) o2;
      double diff = number1.doubleValue() - number2.doubleValue();
      if (diff == 0) {
        return compareTo(list1, list2, columnIndexAndOrder, start + 1);
      } else {
        if (diff < 0) {
          result = -1;
        } else {
          result = 1;
        }
        if (columnIndexAndOrder.get(idx).equalsIgnoreCase("desc")) {
          result *= -1;
        }
        return result;
      }
    }
    @SuppressWarnings("unchecked")
    Comparable<Object> comparable1 = (Comparable<Object>) list1.getValues().get(
        idx);
    @SuppressWarnings("unchecked")
    Comparable<Object> comparable2 = (Comparable<Object>) list2.getValues().get(
        idx);
    result = comparable1.compareTo(comparable2);
    if (columnIndexAndOrder.get(idx).equalsIgnoreCase("desc")) {
      result *= -1;
    }
    if (result == 0) {
      return compareTo(list1, list2, columnIndexAndOrder, start + 1);
    } else {
      return result;
    }
  }

  /**
   * Verifies orders in the result set if a query involves order by in the final
   * output.
   * 
   * @param filename
   *          name of file of actual output
   * @param columnLabels
   *          list of labels of all returned columns
   * @param orderByColumns
   *          map of all order-by columns and their orders (ascending or
   *          descending)
   * @return {@link TestStatus}
   * @throws Exception
   */
  public TestStatus verifyResultSetOrders(String filename,
      List<String> columnLabels, Map<String, String> orderByColumns)
    throws IOException, VerificationException, IllegalAccessException {
    loadFromFileToMap(filename, true);
    Map<Integer, String> columnIndexAndOrder = getColumnIndexAndOrder(
        columnLabels, orderByColumns);
    if (columnIndexAndOrder == null) {
      LOG.debug("skipping order verification");
      return TestStatus.PASS;
    }
    if (!isOrdered(columnIndexAndOrder)) {
      LOG.info("\nOrder mismatch in actual result set.");
      return TestStatus.ORDER_MISMATCH;
    }
    return TestStatus.PASS;
  }

  private Map<Integer, String> getColumnIndexAndOrder(
      List<String> columnLabels, Map<String, String> orderByColumns) {
    Map<Integer, String> columnIndexAndOrder = new LinkedHashMap<Integer, String>();
    List<Integer> indicesOfOrderByColumns = getIndicesOfOrderByColumns(
        columnLabels, orderByColumns);
    if (indicesOfOrderByColumns == null) {
      return null;
    }
    for (int i = 0; i < indicesOfOrderByColumns.size(); i++) {
      columnIndexAndOrder.put(indicesOfOrderByColumns.get(i),
          orderByColumns.get(orderByColumns.keySet().toArray()[i]));
    }
    return columnIndexAndOrder;
  }

  private List<Integer> getIndicesOfOrderByColumns(
      List<String> columnLabels, Map<String, String> orderByColumns) {
    List<Integer> indices = new ArrayList<Integer>();
    for (Map.Entry<String, String> entry : orderByColumns.entrySet()) {
      int index = columnLabels.indexOf(entry.getKey());
      if (index < 0) {
        return null;
      }
      indices.add(index);
    }
    return indices;
  }

  private boolean isOrdered(Map<Integer, String> columnIndexAndOrder) throws VerificationException {
    if (resultSet.size() <= 1) {
      return true;
    }
    ColumnList first = resultSet.get(0);
    for (int i = 1; i < resultSet.size(); i++) {
      ColumnList next = resultSet.get(i);
      int compared = compareTo(first, next, columnIndexAndOrder, 0);
      if (compared <= 0) {
        first = next;
        continue;
      } else {
        LOG.info(first + " : " + next);
        throw new VerificationException("Order mismatch: " + first + " : " + next);
      }
    }
    return true;
  }

  public TestStatus verifyTextPlan(String expectedOutput,
      String actualOutput) throws IOException, VerificationException {
    if (testStatus == TestStatus.EXECUTION_FAILURE
    	|| testStatus == TestStatus.CANCELED) {
      return testStatus;
    }
    StringBuilder sb = new StringBuilder();
    String expected = new String(Files.readAllBytes(Paths.get(expectedOutput)));
    String actual = new String(Files.readAllBytes(Paths.get(actualOutput)));
    boolean verified = false;
    if (verificationTypes.get(0).equalsIgnoreCase("regex")) {
      verified = matchesAll(actual, expected);
    } else {
      verified = containsAll(actual, expected);
    }
    if (verified) {
      return TestStatus.PASS;
    }
    sb.append("\nExpected and actual text plans are different.");
    sb.append("\nExpected:\n" + expected);
    sb.append("\nActual:\n" + actual);
    throw new VerificationException(sb.toString());
  }

  private static boolean matchesAll(String actual, String expected) {
    String[] expectedLines = expected.split("\n");
    actual = actual.trim();
    int i = 0;
    for (String string : expectedLines) {
      string = string.trim();
      Matcher matcher = Pattern.compile(string).matcher(actual);
      if (matcher.find()) {
        String matched = matcher.group();
        i = actual.indexOf(matched);
        actual = actual.substring(i + matched.length()).trim();
      } else {
        return false;
      }
    }
    return true;
  }

  private static boolean containsAll(String actual, String expected) {
    String[] expectedLines = expected.split("\n");
    actual = actual.trim();
    for (String string : expectedLines) {
      string = string.trim();
      int idx = actual.indexOf(string);
      if (idx < 0) {
        return false;
      } else {
        actual = actual.substring(idx + string.length()).trim();
      }
    }
    return true;
  }

  public static Map<String, String> getOrderByColumns(String statement,
                                                      List<String> columnLabels) {
    if (!isOrderByQuery(statement)) {
      return null;
    }
    Map<String, String> orderByColumns = new LinkedHashMap<String, String>();
    String string = getOrderByBlock(statement);
    Pattern pattern = Pattern.compile("order\\s+?by");
    Matcher matcher = pattern.matcher(string.toLowerCase());
    if (matcher.find()) {
      string = string.substring(matcher.end()).trim();
    } else {
      return null;
    }
    String[] columns = string.split(",");
    for (String column : columns) {
      column = column.trim();
      String[] columnOrder = column.split("\\s+");
      String columnName = columnOrder[0].trim();
      if (columnName.indexOf('.') >= 0) {
        columnName = columnName.substring(columnName.indexOf('.') + 1);
      }
      int ordinal = -1;
      try {
        ordinal = Integer.parseInt(columnName);
      } catch (Exception e) {
      }
      if (ordinal > 0) {
        columnName = columnLabels.get(ordinal - 1);
      }
      if (columnOrder.length == 2) {
        orderByColumns.put(columnName, columnOrder[1].trim());
      } else {
        orderByColumns.put(columnName, "asc");
      }
    }
    return orderByColumns;
  }

  public static String getOrderByBlock(String statement) {
    String block = statement;
    int idx = statement.lastIndexOf(')');
    if (idx >= 0) {
      block = block.substring(idx + 1);
    }
    Pattern pattern = Pattern.compile("order\\s+?by");
    Matcher matcher = pattern.matcher(block.toLowerCase());
    if (matcher.find()) {
      block = block.substring(matcher.start());
    } else {
      block = "";
    }
    idx = block.toLowerCase().indexOf("limit");
    if (idx >= 0) {
      block = block.substring(0, idx);
    }
    return block.trim();
  }

  public static boolean isOrderByQuery(String statement) {
    return !getOrderByBlock(statement).isEmpty();
  }

  public static class VerificationException extends Exception {

    public VerificationException(String message) {
      super(message);
    }
  }
}
