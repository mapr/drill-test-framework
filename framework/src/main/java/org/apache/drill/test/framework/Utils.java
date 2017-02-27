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
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.lang.reflect.Field;
import java.net.Inet4Address;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.PropertyResourceBundle;
import java.util.ResourceBundle;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import org.apache.drill.test.framework.TestCaseModeler.DataSource;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.log4j.Logger;

/**
 * Collection of utilities supporting the drill test framework.
 * 
 * 
 */
public class Utils implements DrillDefaults {
  private static final Logger LOG = Logger.getLogger(Utils.class);
  static final Map<Integer, String> sqlTypes;
  static final Map<Integer, String> sqlNullabilities;
  static final Map<String, String> drillProperties;
  
  static {
    // setup sql types
    final Map<Integer, String> map = Maps.newHashMap();
    final Field[] fields = Types.class.getDeclaredFields();
    for (Field field : fields) {
      try {
        map.put((Integer) field.get(Types.class), field.getName());
      } catch (IllegalAccessException e) {
        throw new RuntimeException("Error while initializing sql types.", e);
      }
    }
    sqlTypes = ImmutableMap.copyOf(map);

    // setup sql nullabilities
    final Map<Integer, String> nullabilityMap = Maps.newHashMap();
    final Field[] nullableFields = ResultSetMetaData.class.getDeclaredFields();
    for (Field nullableField : nullableFields) {
      try {
    	nullabilityMap.put((Integer) nullableField.get(ResultSetMetaData.class), nullableField.getName()); 
      } catch (IllegalAccessException e) {
    	  throw new RuntimeException("Error while initializing sql nullabilities.", e);
      }
    }
    sqlNullabilities = ImmutableMap.copyOf(nullabilityMap);
    
    // read configuration file
    final Map<String, String> properties = Maps.newHashMap();
    final File overrideFile = new File(CWD + "/conf/" + DRILL_TEST_CONFIG);
    final ResourceBundle bundle;
    if (overrideFile.exists() && !overrideFile.isDirectory()) {
      try {
        bundle = new PropertyResourceBundle(new FileInputStream(overrideFile));
      } catch (IOException e) {
        throw new RuntimeException("Error reading configuration file " + overrideFile.getPath(), e);
      }
    } else {
      bundle = ResourceBundle.getBundle(DRILL_TEST_CONFIG);
    }
    for (final String key : bundle.keySet()) {
      properties.put(key.trim(), bundle.getString(key).trim());
    }
    drillProperties = ImmutableMap.copyOf(properties);
  }

  /**
   * Constructs an iteration of test case definitions from various test data
   * sources, obtained from the mvn command line option. See README.md for more
   * details.
   * 
   * @return an iteration of object arrays that defines the set of tests to be
   *         executed.
   * @throws Exception
   */
  public static List<DrillTestCase> getDrillTestCases() throws IOException {
    String[] testDefSources = null;
    try {
      testDefSources = TestDriver.cmdParam.sources.split(",");
    } catch (Exception e) {
      testDefSources = new String[] { "" }; //Look at the default location for test definition files
    }
    String[] testGroups = null;
    try {
      testGroups = TestDriver.cmdParam.groups.split(",");
    } catch (Exception e) {
      LOG.info("Test groups not specified.  Will run all collected tests.");
    }
    List<DrillTestCase> drillTestCases = new ArrayList<>();
    for (String testDefSource : testDefSources) {
      testDefSource = getAbsolutePath(testDefSource, TestDriver.drillTestDataDir);
      File testDefSourceFile = new File(testDefSource);
      if (!testDefSourceFile.exists()) {
    	  LOG.error("Directory " + testDefSourceFile.getAbsolutePath() + " does not exist!");
    	  System.exit(-1);
      }
      List<File> testDefFiles = searchFiles(testDefSourceFile, ".*.json");
      for (File testDefFile : testDefFiles) {
//        try {
        TestCaseModeler modeler;
        try {
          modeler = getTestCaseModeler(testDefFile.getAbsolutePath());
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
        if (!foundTests) {continue;}
        
        String queryFileExtension = modeler.matrices.get(0).inputFile;
        String expectedFileExtension = modeler.matrices.get(0).expectedFile;
        boolean skipSuite = false;
        if (modeler.dependencies != null) {
         for (String dependency : modeler.dependencies) {
           if (TestDriver.cmdParam.excludeDependenciesAsList().contains(dependency)) {
             skipSuite = true;
           }
         }
        }
        if (skipSuite) {continue;}
          List<File> testQueryFiles = searchFiles(testDefFile.getParentFile(),
                  queryFileExtension);
          for (File testQueryFile : testQueryFiles) {
            String expectedFileName = getExpectedFile(testQueryFile.getAbsolutePath(), 
            		queryFileExtension, expectedFileExtension);
            drillTestCases.add(new DrillTestCase(modeler, testQueryFile.getAbsolutePath(), expectedFileName));
          }
      }
    }
    if (drillTestCases.size() == 0) {
      LOG.warn("Warning: No test cases have been collected.");
    }
    return drillTestCases;
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
  
  private static TestCaseModeler getTestCaseModeler(String testDefFile)
	      throws IOException {
	    byte[] jsonData = Files.readAllBytes(Paths.get(testDefFile));
	    ObjectMapper objectMapper = new ObjectMapper();
	    return objectMapper.readValue(new String(jsonData), TestCaseModeler.class);
	  }
  
  private static String getExpectedFile(String queryFile, String queryFileExt,
	      String expectedFileExt) {
	    int idx = queryFile.indexOf(queryFileExt.substring(2));
	    return queryFile.substring(0, idx).concat(expectedFileExt.substring(2));
	  }
  
  /**
   * Computes difference between two dates
   * 
   * @param date1
   *          newer date
   * @param date2
   *          older date
   * @param unit
   *          one of "second", "minute", "hour" and "day"
   * @return difference in time in accordance to the unit specified
   */
  public static int getDateDiff(Date date1, Date date2, String unit) {
    int diff = (int) (date1.getTime() - date2.getTime()) / 1000;
    if (unit.equals("second")) {
      return diff;
    }
    diff /= 60;
    if (unit.equals("minute")) {
      return diff;
    }
    diff /= 60;
    if (unit.equals("hour")) {
      return diff;
    }
    diff /= 24;
    if (unit.equals("day")) {
      return diff;
    }
    return 0;
  }

  /**
   * Constructs resolved path for a file. If the file starts with "/", it is
   * assumed to already be an absolute path.
   * 
   * @param filename
   *          name of file for which absolute path is being constructed.
   * @param dataDir
   *          name of test data dir to resolve absolute path from.
   * @return absolute path for a file.
   */
  public static String getAbsolutePath(String filename, String dataDir) {
    if (filename.startsWith("/")) {
      return filename;
    }
    return CWD + "/" + dataDir + "/" + filename;
  }

  /**
   * Reads a query file and returns an array of queries.
   * 
   * @param queryFileName
   *          name of file containing queries
   * @return array of queries
   * @throws IOException
   */
  public static String[] getSqlStatements(String queryFileName)
      throws IOException {
    StringBuilder builder = new StringBuilder();
    BufferedReader reader = new BufferedReader(new FileReader(new File(
        queryFileName)));
    String line = null;
    while ((line = reader.readLine()) != null) {
      builder.append(line + "\n");
    }
    reader.close();
    String[] statements = builder.toString().trim().split(";");
    for(int i=0; i<statements.length; i++) {
      statements[i]=statements[i].trim();
      /*while (statement.endsWith(";")) {
        statement = statement.substring(0, statement.length() - 1);
      }*/
    }
    return statements;
  }

  // this function should only be used while the sql resultset is still valid,
  // i.e. the connection related to the resultset is still valid (not closed)
  public static String getSqlResult(ResultSet resultSet) throws SQLException {
    StringBuffer stringBuffer = new StringBuffer();
	List columnLabels = new ArrayList<String>();

	try {
	  int columnCount = resultSet.getMetaData().getColumnCount();
	  for (int i = 1; i <= columnCount; i++) {
	    columnLabels.add(resultSet.getMetaData().getColumnLabel(i));
	  }
	  List<Integer> types = Lists.newArrayList();
	  for (int i = 1; i <= columnCount; i++) {
	    types.add(resultSet.getMetaData().getColumnType(i));
	  }

	  LOG.debug("Result set data types:");
	  LOG.debug(Utils.getTypesInStrings(types));
	  stringBuffer.append(new ColumnList(types, columnLabels).toString() + "\n");

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
		stringBuffer.append(new ColumnList(types, values).toString() + "\n");
	  }
	} catch (IllegalArgumentException | IllegalAccessException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	} finally {
      if (resultSet != null) {
        resultSet.close();
      }
    }
	return stringBuffer.toString();
  }
  
  /**
   * Turns a list of types in numerical values into one in strings with semantic
   * content.
   * 
   * @param typesInInteger
   *          list of types in numerical values.
   * @return
   * @throws IllegalArgumentException
   * @throws IllegalAccessException
   */
  public static List<String> getTypesInStrings(List<Integer> typesInInteger)
      throws IllegalArgumentException, IllegalAccessException {
    final List<String> typesInStrings = Lists.newArrayList();
    for (final Integer type : typesInInteger) {
      typesInStrings.add(sqlTypes.get(type));
    }
    return typesInStrings;
  }

  /**
   * Turns a list of nullabilities in numerical values into one in strings with semantic
   * content.
   * 
   * @param nullabilitiesInInteger
   *          list of types in numerical values.
   * @return
   * @throws IllegalArgumentException
   * @throws IllegalAccessException
   */
  public static List<String> getNullabilitiesInStrings(List<Integer> nullabilitiesInInteger)
      throws IllegalArgumentException, IllegalAccessException {
    final List<String> nullabilitiesInStrings = Lists.newArrayList();
    for (final Integer nullability : nullabilitiesInInteger) {
      nullabilitiesInStrings.add(sqlNullabilities.get(nullability));
    }
    return nullabilitiesInStrings;
  }
  
  /**
   * Saves content of existing drill storage plugins.
   * 
   * @param ipAddress
   *          IP address of node to update storage plugin for
   * @param pluginType
   *          type of plugin; e.g.: "dfs", "cp"
   * @return content of the specified plugin
   * @throws Exception
   */
  public static String getExistingDrillStoragePlugin(String ipAddress,
      String pluginType) throws IOException {
    StringBuilder builder = new StringBuilder();
    builder.append("http://" + ipAddress + ":8047/storage/" + pluginType);
    HttpUriRequest request = new HttpGet(builder.toString() + ".json");
    DefaultHttpClient client = new DefaultHttpClient();
    HttpResponse response = client.execute(request);
    return getHttpResponseAsString(response);
  }

  /**
   * Updates storage plugin for drill
   * 
   * @param filename
   *          name of file containing drill storage plugin
   * @param ipAddress
   *          IP address of node to update storage plugin for
   * @param pluginType
   *          type of plugin; e.g.: "dfs", "cp"
   * @return true if operation is successful
   */
  public static boolean updateDrillStoragePlugin(String filename,
      String ipAddress, String pluginType, String fsMode) throws IOException {
    String content = getFileContent(filename);
    content = content.replace("localhost", Inet4Address.getLocalHost()
        .getHostAddress());
    if (!fsMode.equals("distributedFS")) {
      content = content.replace("maprfs:", "file:");
      content = content.replaceAll("location\"\\s*:\\s*\"", "location\":\"" + System.getProperty("user.home"));
    }
    return postDrillStoragePlugin(content, ipAddress, pluginType);
  }

  /**
   * Posts/updates drill storage plugin content
   * 
   * @param content
   *          string containing drill storage plugin
   * @param ipAddress
   *          IP address of node to update storage plugin for
   * @param pluginType
   *          type of plugin; e.g.: "dfs", "cp"
   * @return true if operation is successful
   * @throws Exception
   */
  public static boolean postDrillStoragePlugin(String content,
      String ipAddress, String pluginType) throws IOException {
      StringBuilder builder = new StringBuilder();
      builder.append("http://" + ipAddress + ":8047/storage/" + pluginType);
      HttpPost post = new HttpPost(builder.toString() + ".json");
      post.setHeader("Content-Type", "application/json");
      post.setEntity(new StringEntity(content));
      DefaultHttpClient client = new DefaultHttpClient();
      HttpResponse response = client.execute(post);
      return isResponseSuccessful(response);
  }

  private static String getFileContent(String filename) throws IOException {
    String path = new File(filename).getAbsolutePath();
    byte[] encoded = Files.readAllBytes(Paths.get(path));
    return new String(encoded, "UTF-8");
  }

  private static String getHttpResponseAsString(HttpResponse response) throws IOException {
    Reader reader = new BufferedReader(new InputStreamReader(response
        .getEntity().getContent(), "UTF-8"));
    StringBuilder builder = new StringBuilder();
    char[] buffer = new char[1024];
    int l = 0;
    while (l >= 0) {
      builder.append(buffer, 0, l);
      l = reader.read(buffer);
    }
    return builder.toString();
  }

  private static boolean isResponseSuccessful(HttpResponse response) throws IOException {
    return getHttpResponseAsString(response).toLowerCase().contains(
        "\"result\" : \"success\"");
  }

  public static String generateOutputFileName(String inputFileName,
                                        String testId, boolean isPlan) throws IOException {
    File drillOutputDir = new File(TestDriver.drillOutputDir);
    if (!drillOutputDir.exists()) {
      if (!drillOutputDir.mkdir()) {
        LOG.debug("Cannot create directory " + TestDriver.drillOutputDir
            + ".  Using /tmp for drill output");
        TestDriver.drillOutputDir = "/tmp";
      }
    }
    int index = inputFileName.lastIndexOf('/');
    String queryName = inputFileName.substring(index + 1);
    queryName = queryName.split("\\.")[0];
    String outputFileName = TestDriver.drillOutputDir + "/" + testId + "_" + queryName;
    if (isPlan) {
      outputFileName += ".plan";
    } else {
      outputFileName += ".output_"
          + new Date().toString().replace(' ', '_');
    }
    return outputFileName;
  }
  
  public static void deleteFile(String filename) {
	try {
		Path path = FileSystems.getDefault().getPath(filename);
		Files.delete(path);
	} catch (IOException e) {
		e.printStackTrace();
	}
  }
  
  public static int getNumberOfClusterNodes() {
	return drillProperties.containsKey("NUMBER_OF_CLUSTER_NODES") ?
	  Integer.parseInt(drillProperties.get("NUMBER_OF_CLUSTER_NODES")) : 0;
  }
  
  public static int getNumberOfDrillbits(Connection connection) {
	String query = "select count(*) from sys.drillbits";
	int numberOfDrillbits = 0;
	try {
	  ResultSet resultSet = execSQL(query, connection);
	  resultSet.next();
	  numberOfDrillbits = resultSet.getInt(1);
	} catch (SQLException e) {
		LOG.error(e.getMessage());
		e.printStackTrace();
	}
	return numberOfDrillbits;
  }
  

  public static CmdConsOut execCmd(String cmd){
	return ShellRunner.INSTANCE.execCmd(cmd);
  }
  
  public static ResultSet execSQL(String sql, Connection connection) throws SQLException {
	try {
	  Statement statement = connection.createStatement();
	  return statement.executeQuery(sql);
	} catch (SQLException e) {
	  LOG.error(e.getMessage());
	  e.printStackTrace();
      try {
		connection.close();
	  } catch (SQLException e1) {
		LOG.error(e.getMessage());e1.printStackTrace();
	  }
      throw e;
	}
  }

  /**
   * Parses json string to get the node for a specified key
   * 
   * @param jsonString
   *          json string to be parsed
   * @param key
   *          key for the value to be determined
   * @return JsonNode
   * @throws IOException if jsonString is not valid
   */
  public static JsonNode getJsonValue(String jsonString, String key)
        throws IOException {
        ObjectMapper oM = new ObjectMapper();
        JsonNode rootNode = oM.readTree(jsonString);
        // key has format key1.key2.key3
        // change to format /key1/key2/key3
        String ptrExpr = "/" + key.replace(".","/");
        return rootNode.at(ptrExpr);
  }

}
