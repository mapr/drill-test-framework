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
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.fasterxml.jackson.databind.JsonNode;
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
  private List<Integer> types = null;
  private String query;
  private List<String> columnLabels;
  private List<String> verificationTypes;
  private boolean checkType = true;

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

  public TestVerifier() {
	this.checkType = false;
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
      String actualOutput, boolean verifyOrderBy) throws IOException, VerificationException,
      													 IllegalAccessException {
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
  public TestStatus verifyResultSet(String expectedOutput, String actualOutput) 
		  	throws IllegalAccessException, IOException, VerificationException {
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
  public TestStatus verifyResultSet(String expectedOutput, String actualOutput, boolean verifyOrderBy) 
		  			throws IOException, VerificationException, IllegalAccessException {
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
    
    testStatus = expectedMap.equals(actualMap) ? TestStatus.PASS : TestStatus.VERIFICATION_FAILURE;
    
    if (testStatus == TestStatus.VERIFICATION_FAILURE) {
      List<ColumnList> unexpectedList = new ArrayList<ColumnList>();
      int unexpectedCount = 0;
      Iterator<Map.Entry<ColumnList, Integer>> iterator = actualMap.entrySet().iterator();
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
      throw new VerificationException(printSummary(unexpectedList, unexpectedCount, 
    		expectedMap, expectedCount, actualCount, verifyOrderBy));
    }

    if (checkType) {
      Map<String,String> orderByColumns = getOrderByColumns(query, columnLabels);
      if (orderByColumns != null) {
        testStatus = verifyResultSetOrders(actualOutput, columnLabels, orderByColumns);
      }
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
  private Map<ColumnList, Integer> loadFromFileToMap(String filename, boolean ordered) 
		  		throws VerificationException, IOException, IllegalAccessException {
    if (checkType && types == null) {
      throw new VerificationException("Fatal: Types in the result set is null.  "
          + "This most likely resulted from failed execution.");
    }
    int size = 0;
    if (checkType) size = types.size();
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
      if (checkType && fields.length != size) {
        StringBuilder sb = new StringBuilder();
        sb.append("Error: expected data and actual data have different number of columns.");
        sb.append("\nNumber of columns in expected data: " + fields.length);
        sb.append("\nNumber of columns in actual data: " + size);
        sb.append("\nFirst row of expected data:\n" + line);
        sb.append("\nTypes in actual data: " + Utils.getTypesInStrings(types));
        reader.close();
        throw new VerificationException(sb.toString());
      }
      List<Object> typedFields = Lists.newArrayList();
      for (int i = 0; i < fields.length; i++) {
        if (!checkType || types.size() == 0) {
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
      Map<Integer, String> columnIndexAndOrder, int start)
       throws VerificationException {
    // convert map into a list
    List<IndexAndOrder> columnIndexAndOrderList = new ArrayList<IndexAndOrder>();
    for (Map.Entry<Integer, String> entry : columnIndexAndOrder.entrySet()) {
      IndexAndOrder indexAndOrder = new IndexAndOrder();
      indexAndOrder.index = entry.getKey();
      indexAndOrder.order = entry.getValue();
      columnIndexAndOrderList.add (indexAndOrder);
    }
    return compareTo(list1, list2, columnIndexAndOrderList, start, null);
  }

  /**
   * Compare two rows, represented by list1 and list2.
   * Compare the two rows in the order specified in the order by clause.  If the
   * two rows have have different values in the first order-by column, then it
   * can be determined if they are in the right order without looking at the
   * second order-by column.  If the two rows have the same value in the first
   * order-by column, then the second order-by column is checked.  The second
   * order-by column (and subsequent order-by columns) are handled in a recursive
   * call to this procedure.
   * Numerical values are handled separately from other values.
   * JSON strings have special handling because they have to be parsed.  A field
   * within a JSON string can be used in an order-by clause, so the field needs
   * to be extracted from the JSON string.
   * This code currently handles integer and string values in JSON strings.
   */
  private static int compareTo(ColumnList list1, ColumnList list2,
      List<IndexAndOrder> columnIndexAndOrder, int start,
      Map<String, String> orderByColumns) throws VerificationException {
    if (start == columnIndexAndOrder.size()) {
      return 0;
    }
    int idx = columnIndexAndOrder.get(start).index;
    int result = -1;
    Object o1 = list1.getValues().get(idx);
    Object o2 = list2.getValues().get(idx);
    if (ColumnList.bothNull(o1, o2)) {
      return compareTo(list1, list2, columnIndexAndOrder, start + 1, orderByColumns);
    } else if (ColumnList.oneNull(o1, o2)) {
      return 0; // TODO handle NULLS FIRST and NULLS LAST cases
    }
    if (o1 instanceof Number) {
      Number number1 = (Number) o1;
      Number number2 = (Number) o2;
      double diff = number1.doubleValue() - number2.doubleValue();
      if (diff == 0) {
        return compareTo(list1, list2, columnIndexAndOrder, start + 1, orderByColumns);
      } else {
        if (diff < 0) {
          result = -1;
        } else {
          result = 1;
        }
        if (columnIndexAndOrder.get(start).order.equalsIgnoreCase("desc")) {
          result *= -1;
        }
        return result;
      }
    }
    if (o1 instanceof String) {
      // check if JSON string
      try {
        String string1 = (String) o1;
        String string2 = (String) o2;
        if (orderByColumns != null) {
          String fieldName;
          String columnName = (String) orderByColumns.keySet().toArray()[start];
          if (columnName.indexOf('.') >= 0) {
            // there is a field in the JSON string
            fieldName = columnName.substring(columnName.indexOf('.') + 1);
            JsonNode idNode1 = Utils.getJsonValue (string1, fieldName);
            JsonNode idNode2 = Utils.getJsonValue (string2, fieldName);
            // if a field is missing, treat it as a null
            if ( (idNode1.isMissingNode()) && (idNode2.isMissingNode()) ) {
              return 0;
            } else if (idNode2.isMissingNode()) {
              return -1;
            } else if (idNode1.isMissingNode()) {
              return 1;
            }
            if (idNode1.isNumber()) {
              Number number1 = (Number) idNode1.asInt();
              Number number2 = (Number) idNode2.asInt();
              double diff = number1.doubleValue() - number2.doubleValue();
              if (diff == 0) {
                return compareTo(list1, list2, columnIndexAndOrder, start + 1, orderByColumns);
              } else {
                if (diff < 0) {
                  result = -1;
                } else {
                  result = 1;
                }
                if (columnIndexAndOrder.get(start).order.equalsIgnoreCase("desc")) {
                  result *= -1;
                }
                return result;
              }
            } else if (idNode1.isTextual()) {
              String string3 = (String) idNode1.asText();
              String string4 = (String) idNode2.asText();
              int stringCompare = string3.compareTo(string4);
              if (stringCompare == 0) {
                return compareTo(list1, list2, columnIndexAndOrder, start + 1, orderByColumns);
              } else {
                if (stringCompare < 0) {
                  result = -1;
                } else {
                  result = 1;
                }
                if (columnIndexAndOrder.get(start).order.equalsIgnoreCase("desc")) {
                  result *= -1;
                }
                return result;
              }
            } else {
              throw new VerificationException ("JSON string field " + fieldName + " is not a number: " + string1);
            }
          }
        }
      } catch (IOException e) {
        // do nothing.  continue with code below
      }
    }
    @SuppressWarnings("unchecked")
    Comparable<Object> comparable1 = (Comparable<Object>) list1.getValues().get(
        idx);
    @SuppressWarnings("unchecked")
    Comparable<Object> comparable2 = (Comparable<Object>) list2.getValues().get(
        idx);
    result = comparable1.compareTo(comparable2);
    if (columnIndexAndOrder.get(start).order.equalsIgnoreCase("desc")) {
      result *= -1;
    }
    if (result == 0) {
      return compareTo(list1, list2, columnIndexAndOrder, start + 1, orderByColumns);
    } else {
      return result;
    }
  }

  private static class IndexAndOrder {
    private int index;
    private String order;
  }

  /**
   * Verifies orders in the result set if a query involves order by in the final
   * output.
   * There are some requirements for a query to be properly validated.
   * 1) All columns/fields in the order-by clause must appear in the projection
   *    list
   * 2) Expressions cannot be used in the order-by clause.  Things like
   *    "order by column.field[2]".  The [2] indicates an expression which is
   *    the third element in the field array.
   * 3) Referencing a field within a json string in a column is more complicated.
   *    Most cases are supported.  Some cases may not work.
   * 4) If a query references more than one table, then use aliases for each
   *    column in the projection list, and reference these aliases in the
   *    order-by clause.  Using aliases is a good practice in general when
   *     verifying an order-by clause.
   * 5) The order-by clause cannot be followed by another SQL operation except
   *    for limit.  See the code in getOrderByBlock to understand this comment
   *    better.  If the order-by clause is followed by an offset or collate,
   *    for example, it might not work.  For now, there are bugs related to
   *    offset, and collate is not supported, so this is probably not a major
   *    issue.
   *
   * This code assumes that the output of the query (result set) contains the
   * columns in the order-by clause.  If so, then these columns can be used to
   * verify that the rows are presented in the order specified.  If one or more
   * order-by columns are not present in the result set, then it cannot be
   * verified that the rows are in the correct order, and this part of the
   * verification is skipped.
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
    List<IndexAndOrder> columnIndexAndOrder = getColumnIndexAndOrderList(
        columnLabels, orderByColumns, true);
    // if one or more order-by columns is not present in the result set,
    // then skip this part of the verification.
    if (columnIndexAndOrder == null) {
      LOG.debug("skipping order verification");
      return TestStatus.PASS;
    }
    if (!isOrdered(columnIndexAndOrder, orderByColumns)) {
      LOG.info("\nOrder mismatch in actual result set.");
      return TestStatus.ORDER_MISMATCH;
    }
    return TestStatus.PASS;
  }

  private Map<Integer, String> getColumnIndexAndOrder(
      List<String> columnLabels, Map<String, String> orderByColumns) {
    List<IndexAndOrder> result = getColumnIndexAndOrderList(columnLabels,
                                                            orderByColumns, false);
    if (result == null) {
      return null;
    }
    // convert list to map
    Map<Integer, String> columnIndexAndOrderMap = new LinkedHashMap<Integer, String>();
    for (IndexAndOrder index : result) {
      columnIndexAndOrderMap.put(index.index, index.order);
    }
    return columnIndexAndOrderMap;
  }

  /**
   * Create a list that represents the order by columns.  Each element in the
   * list (IndexAndOrder structure) indicates the ordinal position of the
   * column, and whether it is ordered in ascending or descending order.  A
   * column can appear more than once, especially if it contains a JSON string,
   * and individual fields in the JSON string are being used in the order-by
   * clause.
   * checkForFields is set to true to enable the code to work with JSON strings.
   * checkForFields is set to false to retain the original functionality to
   * maintain backwards-compatibility.  checkForFields is passed through to
   * getIndicesOfOrderByColumns.
   */
  private List<IndexAndOrder> getColumnIndexAndOrderList(
      List<String> columnLabels, Map<String, String> orderByColumns,
      boolean checkForFields) {
    List<IndexAndOrder> columnIndexAndOrder = new ArrayList<IndexAndOrder>();
    List<Integer> indicesOfOrderByColumns = getIndicesOfOrderByColumns(
        columnLabels, orderByColumns, checkForFields);
    if (indicesOfOrderByColumns == null) {
      return null;
    }
    for (int i = 0; i < indicesOfOrderByColumns.size(); i++) {
      IndexAndOrder indexAndOrder = new IndexAndOrder();
      indexAndOrder.index = indicesOfOrderByColumns.get(i);
      indexAndOrder.order = orderByColumns.get(orderByColumns.keySet().toArray()[i]);
      columnIndexAndOrder.add(indexAndOrder);
    }
    return columnIndexAndOrder;
  }

  private List<Integer> getIndicesOfOrderByColumns(
      List<String> columnLabels, Map<String, String> orderByColumns) {
    return getIndicesOfOrderByColumns(columnLabels, orderByColumns, false);
  }

  /**
   * Create a list of integers that represents the order by columns.  Each column 
   * is represented by its ordinal position.  A column can appear more than once,
   * especially if it contains a JSON string, and individual fields in the JSON
   * string are being used in the order-by clause.
   * Verify that each order by column is present in the result set (as indicated
   * by columnLabels).
   * checkForFields is set to true to enable the code to work with JSON strings.
   * checkForFields is set to false to retain the original functionality to
   * maintain backwards-compatibility
   */
  private List<Integer> getIndicesOfOrderByColumns(
      List<String> columnLabels,
      Map<String, String> orderByColumns,
      boolean checkForFields) {
    List<Integer> indices = new ArrayList<Integer>();
    for (Map.Entry<String, String> entry : orderByColumns.entrySet()) {
      String entryKey = entry.getKey();
      if (checkForFields && (entryKey.indexOf('.') >= 0)) {
        // column name has sub-field names.  remove them.
        entryKey = entryKey.substring(0, entryKey.indexOf('.'));
      }
      // verify that each order by column is present in the result set by
      // checking columnLabels, which represents the columns in the result set.
      // if an order by column is not in the result set, return null.
      int index = columnLabels.indexOf(entryKey);
      if (index < 0) {
        return null;
      }
      indices.add(index);
    }
    return indices;
  }

  private boolean isOrdered(Map<Integer, String> columnIndexAndOrder) throws VerificationException {
    // convert map to a list
    List<IndexAndOrder> columnIndexAndOrderList = new ArrayList<IndexAndOrder>();
    for (Map.Entry<Integer, String> entry : columnIndexAndOrder.entrySet()) {
      IndexAndOrder indexAndOrder = new IndexAndOrder();
      indexAndOrder.index = entry.getKey();
      indexAndOrder.order = entry.getValue();
      columnIndexAndOrderList.add(indexAndOrder);
      }
    return isOrdered(columnIndexAndOrderList, null);
  }

  private boolean isOrdered(List<IndexAndOrder> columnIndexAndOrder,
                            Map<String, String> orderByColumns)
                            throws VerificationException {
    if (resultSet.size() <= 1) {
      return true;
    }
    ColumnList first = resultSet.get(0);
    for (int i = 1; i < resultSet.size(); i++) {
      ColumnList next = resultSet.get(i);
      int compared = compareTo(first, next, columnIndexAndOrder, 0,
                               orderByColumns);
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
    
    //replace injections
    for (String key : TestDriver.injections.keySet()) {
      expected = expected.replaceAll("\\{" + key + "\\}", TestDriver.injections.get(key));
    }

    String actual = new String(Files.readAllBytes(Paths.get(actualOutput)));
    boolean verified = false;
    if (verificationTypes.get(0).equalsIgnoreCase("regex")) {
      verified = matchesAll(actual, expected);
    } else if (verificationTypes.get(0).equalsIgnoreCase("regex-no-order")) {
      verified = matchesAll(actual, expected, false);
    } else if (verificationTypes.get(0).equalsIgnoreCase("filter-ratio")) {
      verified = matchAndCompareAll(actual, expected);
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
    return matchesAll(actual, expected, true);
  }

  /**
   * checkOrder is set when the order of the regex patterns in the
   * expected results file is the same as the order of the patterns
   * in the actual output.
   * Set checkOrder to be false if the two orders can be different.
   */
  private static boolean matchesAll(String actual, String expected,
                                    boolean checkOrder) {
    String[] expectedLines = expected.split("\n");
    actual = actual.trim();
    int i = 0;
    for (String string : expectedLines) {
      string = string.trim();
      Matcher matcher = Pattern.compile(string).matcher(actual);
      if (!matcher.find()) {
        return false;
      }
      // if checkOrder is false, do nothing.  check remaining expectedLines
      if (checkOrder) {
        String matched = matcher.group();
        i = actual.indexOf(matched);
        actual = actual.substring(i + matched.length()).trim();
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

  /**
   * Used to verify tests for DRILL-4743
   * Verifies that rowcount for Filter step in the explain plan is
   * reasonable by comparing the rowcount in the Filter step with
   * the rowcount in the input step, which is the previous step.
   * If minRowcountFraction is specified, then the filter rowcount >=
   *                        minRowcountFraction * input rowcount
   * If maxRowcountFraction is specified, then the filter rowcount <=
   *                        maxRowcountFraction * input rowcount
   * Expected results file looks like this:
   *
   *    min_selectivity_estimate_factor = 0.3
   *    Filter.*?\n.*?\n
   *
   * min_selectivity_estimate_factor is stored in minRowcountFraction.
   * The second line is the Java Pattern to grab the Filter step and
   * the input step.  The rowcounts are extracted from the Filter step
   * and the input step, and compared as described above.  This is
   * repeated for each Filter step.
   *
   * @param actual
   *          actual results
   * @param expected
   *          expected results
   * @return true/false
   */
  private static boolean matchAndCompareAll(String actual, String expected) {
    String[] expectedLines = expected.split("\n");
    actual = actual.trim();
    Double minRowcountFraction = 0.0;
    Double maxRowcountFraction = 1.0;
    for (int index = 0; index < expectedLines.length; index++) {
      expectedLines[index] = expectedLines[index].trim();
      String[] expectedStrings = expectedLines[index].split("=");
      // check if minRowcountFraction is specified
      if (expectedStrings[0].trim().equals("min_selectivity_estimate_factor")) {
         minRowcountFraction = Double.parseDouble(expectedStrings[1].trim());
         continue;
      }
      // check if maxRowcountFraction is specified
      if (expectedStrings[0].trim().equals("max_selectivity_estimate_factor")) {
         maxRowcountFraction = Double.parseDouble(expectedStrings[1].trim());
         continue;
      }
      // check for Filter step in actual output
      Matcher matcher = Pattern.compile(expectedStrings[0], Pattern.DOTALL).matcher(actual);
      if (!matcher.find()) {
        LOG.info("Did not find \'" + expectedStrings[0] + "\' in actual output");
        return false;
      }
      matcher.reset();
      while (matcher.find()) {
        String matched = matcher.group();
        // get rowcount values in Filter step and input step
        Matcher matcher2 = Pattern.compile("(rowcount = \\d+\\.\\d*).*?\n.*?(rowcount = \\d+\\.\\d*)", Pattern.DOTALL).matcher(matched);
        if (matcher2.find()) {
          // get rowcount value for Filter step
          String filterStep = matcher2.group(1);
          String[] values = filterStep.split(" ");
          double filterRowcount = Double.parseDouble(values[2]);
          // get rowcount value for input step
          String inputStep = matcher2.group(2);
          values = inputStep.split(" ");
          double inputRowcount = Double.parseDouble(values[2]);
          // check if actual rowcount is too small
          if (filterRowcount < (minRowcountFraction * inputRowcount)) {
            LOG.info("Actual Filter rowcount " + filterRowcount + " < minFraction " + minRowcountFraction + " * input rowcount " + inputRowcount);
            return false;
          }
          // check if actual rowcount is too large
          if (filterRowcount > (maxRowcountFraction * inputRowcount)) {
            LOG.info("Actual Filter rowcount " + filterRowcount + " > maxFraction " + maxRowcountFraction + " * input rowcount " + inputRowcount);
            return false;
          }
        } else {
          LOG.info("Did not find rowcount in \'" + matched + "\'");
          return false;
        }
      }
    }
    return true;
  }

  /**
   * Create a map containing the names of the columns in the order-by clause and
   * whether they are being ordered in ascending or descending order.
   * Remove the table name from the column name because the column name in the
   * order-by clause will be compared with the column name in the resultSet
   * returned by the Driver, and the Driver does not return table names.
   */
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
      String fieldName;
      if (columnName.indexOf('.') >= 0) {
        // table name precedes column name.  remove it
        columnName = columnName.substring(columnName.indexOf('.') + 1);
      }
      int ordinal = -1;
      // if columnName is an ordinal position, then get the column name
      // that it corresponds to.
      try {
        ordinal = Integer.parseInt(columnName);
      } catch (Exception e) {
      }
      if (ordinal > 0) {
        columnName = columnLabels.get(ordinal - 1);
      }
      if (columnOrder.length == 2) {
        // if ascending or descending has been specified, then
        // store this in orderByColumns
        orderByColumns.put(columnName, columnOrder[1].trim());
      } else {
        // assume ascending
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
