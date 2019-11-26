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

import org.apache.commons.io.FilenameUtils;

import java.io.*;
import java.lang.reflect.Field;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.GeneralSecurityException;
import java.security.KeyStore;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.common.io.Resources;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.log4j.Logger;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManagerFactory;

import static org.apache.drill.test.framework.DrillTestDefaults.*;

/**
 * Collection of utilities supporting the drill test framework.
 *
 */
public class Utils {
  private static final Logger LOG = Logger.getLogger("DrillTestLogger");
  private static final Map<Integer, String> sqlTypes;
  private static final Map<Integer, String> sqlNullabilities;
  private static HttpClient client;
  private static String protocol = "http://";

  /**
   * Creates connection properties from DrillTestConfig
   * @return connection properties
   */
  public static Properties createConnectionProperties() {
    Properties connectionProperties = new Properties();

    if (DrillTestDefaults.AUTHENTICATION_MECHANISM.equals("PLAIN")) {
      connectionProperties.put("auth", "PLAIN");
    } else if (DrillTestDefaults.AUTHENTICATION_MECHANISM.equals("MAPRSASL")) {
      connectionProperties.put("auth", "MAPRSASL");
    } else if (DrillTestDefaults.AUTHENTICATION_MECHANISM.equals("KERBEROS")) {
      connectionProperties.put("auth", "KERBEROS");
      connectionProperties.put("principal", DrillTestDefaults.KERBEROS_PRINCIPAL);
    }

    if (DrillTestDefaults.SSL_ENABLED) {
      connectionProperties.put("enableTLS", "true");
      connectionProperties.put("disableHostVerification", "true");
      connectionProperties.put("trustStorePath", DrillTestDefaults.TRUSTSTORE_PATH);
      connectionProperties.put("trustStorePassword", DrillTestDefaults.TRUSTSTORE_PASSWORD);
    }

    return connectionProperties;
  }

  // Accept self-signed certificate
  public static class MyHostNameVerifier implements HostnameVerifier {

    @Override
    public boolean verify(String s, SSLSession sslSession) {
      return true;
    }
  }
  
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

    client = getHTTPClientInstance();
    if (DrillTestDefaults.AUTHENTICATION_MECHANISM.equals("PLAIN")) {
      authenticateHTTPClient();
    }
  }

  /**
   * Create a HttpClients instance.
   * @return Returns a default HttpClient instance or a custom instance if SSL is enabled
   */
  public static HttpClient getHTTPClientInstance() {
    HttpClient client;
    if (DrillTestDefaults.HTTPS_ENABLED) {
      protocol = "https://";

      final SSLConnectionSocketFactory socketFactory;

      try {
        final KeyStore keyStore = KeyStore.getInstance("JKS");
        try (final InputStream is = new FileInputStream(DrillTestDefaults.TRUSTSTORE_PATH)) {
          keyStore.load(is, DrillTestDefaults.TRUSTSTORE_PASSWORD.toCharArray());
        }

        final TrustManagerFactory tmf = TrustManagerFactory.getInstance(TrustManagerFactory.getDefaultAlgorithm());
        tmf.init(keyStore);

        final SSLContext sc = SSLContext.getInstance("TLS");
        sc.init(null, tmf.getTrustManagers(), new java.security.SecureRandom());
        socketFactory = new SSLConnectionSocketFactory(sc, new MyHostNameVerifier());
      } catch (GeneralSecurityException | IOException ex) {
        LOG.info("Problem validating ssl truststore");
        throw new RuntimeException(ex);
      }
      client = HttpClients.custom().setSSLSocketFactory(socketFactory).build();
    } else {
      client = HttpClients.createDefault();
    }
    return client;
  }

  /**
   * Rest server authentication when plain authentication is enabled
   */
  public static void authenticateHTTPClient() {
    HttpPost post = new HttpPost(protocol + DrillTestDefaults.DRILL_STORAGE_PLUGIN_SERVER + ":" + DrillTestDefaults.DRILL_STORAGE_PLUGIN_SERVER_PORT + "/j_security_check");
    post.setHeader("Content-Type", "application/x-www-form-urlencoded");
    List<NameValuePair> postParameters = new ArrayList<>();
    postParameters.add(new BasicNameValuePair("j_username", DrillTestDefaults.USERNAME));
    postParameters.add(new BasicNameValuePair("j_password", DrillTestDefaults.PASSWORD));

    try {
      post.setEntity(new UrlEncodedFormEntity(postParameters, "UTF-8"));
      CloseableHttpResponse response = (CloseableHttpResponse) client.execute(post);
      response.close();
    } catch (IOException ex) {
      throw new RuntimeException(ex);
    }
  }

 /**
 * Check if the value passed to the -s parameter (test definition sources) can be 
 * expanded as a regex expression and use that to construct the list of test definitions
 *
 * @return list of test definition sources to execute
 */
  public static String[] getTestDefSources() throws IOException {

    String[] testDirExpressions;
    try {
     testDirExpressions = TestDriver.cmdParam.sources.split(",");
    } catch (Exception e) {
      testDirExpressions = new String[] { "" }; //Look at the default location for test definition files
    }

    for (String relTestDirExpression : testDirExpressions) {
      String absoluteTestDirExpression = getAbsolutePath(relTestDirExpression, DrillTestDefaults.DRILL_TESTDATA_DIR);
      File absoluteTestDirExpressionFile = new File(absoluteTestDirExpression);
      List<File> testDefinitionList = new ArrayList<>();
      if (!absoluteTestDirExpressionFile.exists()) {
        //try regex then exit if failure
        File drillTestDataDir = new File(DrillTestDefaults.TEST_ROOT_DIR + "/" + DrillTestDefaults.DRILL_TESTDATA_DIR);
        testDefinitionList.addAll(getTestDefinitionList(drillTestDataDir,absoluteTestDirExpression));
        if(testDefinitionList.isEmpty()){
          LOG.info("No regex Found for "+relTestDirExpression);
	  return testDirExpressions;
        }
        else{
          List<String> defSrcList = new ArrayList<>(Arrays.asList(testDirExpressions));
          defSrcList.remove(relTestDirExpression);
          for(File testDefinition : testDefinitionList){
            defSrcList.add(testDefinition.getAbsolutePath());
          }
          testDirExpressions = new String[defSrcList.size()];
	  testDirExpressions = defSrcList.toArray(testDirExpressions);
        }
      }
    }
    return testDirExpressions;
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
    
    String[] testDefSources = getTestDefSources();
    String[] testGroups = null;
    try {
      testGroups = TestDriver.cmdParam.groups.split(",");
    } catch (Exception e) {
      LOG.info("Test groups not specified.  Will run all collected tests.");
    }
    List<DrillTestCase> drillTestCases = new ArrayList<>();
    for (String testDefSource : testDefSources) {
      testDefSource = getAbsolutePath(testDefSource, DrillTestDefaults.DRILL_TESTDATA_DIR);
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
        String failExtension = modeler.matrices.get(0).failExtension;
	String originalQueryFileExtension = queryFileExtension;
        //To include fail extension in the regex to pick query files tagged as failure as well 
	if(TestDriver.cmdParam.runFailed == true){
	  if(failExtension!=null){
	    //To get the last part if there are multiple dots in the name (multiple extensions) instead of using substring
	    if(FilenameUtils.getExtension(failExtension)!=null && FilenameUtils.getExtension(failExtension)!="")
	    {
	      failExtension = FilenameUtils.getExtension(failExtension);	
	    }
            // add queryFileExtension.substring to include ".q" or ".sql"
            // this prevents expected results files with the "fail" extension from being picked up
            // so queryFileExtension now looks like this: "*.q.fail"
            queryFileExtension = ".*"+queryFileExtension.substring(2)+"."+failExtension;
	  }
	  else{ 
            // add queryFileExtension.substring to include ".q" or ".sql"
            // this prevents expected results files with the "fail" extension from being picked up
            // so queryFileExtension now looks like this: "*.q.fail"
            queryFileExtension =    ".*" + queryFileExtension.substring(2) + ".(fail|failing)";
	  }
        }
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
          //Expected File to find based on the original query Extension
          String expectedFileName = getExpectedFile(testQueryFile.getAbsolutePath(),
                    originalQueryFileExtension, expectedFileExtension);
          if (expectedFileName != null) {
            drillTestCases.add(new DrillTestCase(modeler, testQueryFile.getAbsolutePath(), expectedFileName));
          }
        }
      }
    }
    if (drillTestCases.size() == 0) {
      LOG.warn("Warning: No test cases have been collected.");
    }
    return drillTestCases;
  }
  
  private static List<File> searchFiles(File root, String regex) throws FileNotFoundException {
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
	      File[] files = root.listFiles();
	      if (files != null) { //Directory exists
            for (File file : files) {
              if (!file.getName().equals("datasources")) {
                list.addAll(searchFiles(file, regex));
              }
            }
          } else {
            throw new FileNotFoundException("Pathname, \"" + root.getPath() + "\"" +
                    " does not exist or does not denote a directory");
          }
	    }
	    return list;
	  }

  private static List<File> getTestDefinitionList(File root, String regex) throws FileNotFoundException {
          List<File> list = new ArrayList<File>();
          Pattern pattern = Pattern.compile(regex + "$");
          Matcher matcher = null;
          if (!root.isFile()) {
            matcher = pattern.matcher(root.getAbsolutePath());
            if (matcher.find()) {
              list.add(root);
              return list;
            } else{
              File[] files = root.listFiles();
              if (files != null) { //Directory exists
                for (File file : files) {
                  if (!file.getName().equals("datasources")) {
                    list.addAll(getTestDefinitionList(file, regex));
                  }
                }
              } else {
                throw new FileNotFoundException("Pathname, \"" + root.getPath() + "\"" +
                        " does not exist or does not denote a directory");
              }
	    }
	  }
          return list;
         }
  
  private static TestCaseModeler getTestCaseModeler(String testDefFile)
	      throws IOException {
	    byte[] jsonData = Files.readAllBytes(Paths.get(testDefFile));
	    ObjectMapper objectMapper = new ObjectMapper();
            // check if submitType should be over-ridden to odbc
            TestCaseModeler testCaseModeler = objectMapper.readValue(new String(jsonData), TestCaseModeler.class);
            if (TestDriver.cmdParam.driverExt != null &&
                TestDriver.cmdParam.driverExt.equals(TestDriver.cmdParam.SIMBA_ODBC)) {
              testCaseModeler.submitType = "odbc";
              if (testCaseModeler.script == null) {
                testCaseModeler.script = "Functional/odbcTest.py";
              }
            }
	    return testCaseModeler;
	  }

  private static String getExpectedFile(String queryFile, String queryFileExt,
	      String expectedFileExt) {
	    int idx = queryFile.indexOf(queryFileExt.substring(2));
	    if(idx<0){//Check if queryFileExt not found as a substring in queryFile and if idx is negative if negative return empty string and the queryFile will not be added to tests scheduled to run 
	      return "";
	    }
            String Filename = null;
            String FilenameJDBC = null;
            String driverExt = TestDriver.cmdParam.driverExt;
            if (driverExt == null) {
              // no driver has been specified.  use Apache.
              return queryFile.substring(0, idx).concat(expectedFileExt.substring(2));
            } else {
              // if expected results file with driver extension exists, then use it
              //     i.e. query.e_tsv.sjdbc
              // else if expected result file with driver extension and .fail exists, and skip this test
              //     i.e. query.e_tsv.sjdbc.fail
              // else use Apache.
              Filename = queryFile.substring(0, idx).concat(expectedFileExt.substring(2));
              FilenameJDBC = Filename.concat(".").concat(driverExt);
              File driverFile = new File(FilenameJDBC);
              if (driverFile.exists()) {
                return FilenameJDBC;
              } else {
                FilenameJDBC = FilenameJDBC.concat(".fail");
                driverFile = new File(FilenameJDBC);
                if (driverFile.exists()) {
                  return null;
                } else {
                  return Filename;
                }
              }
            }
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
    return DrillTestDefaults.TEST_ROOT_DIR + "/" + dataDir + "/" + filename;
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
      line = line.trim();
      //skip comment line
      if (line.startsWith("--") && !line.startsWith("--@test")) {
    	//do nothing
      } else {
        builder.append(line + "\n");
      }
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
	  stringBuffer.append(new ColumnList(types, columnLabels).toString()).append("\n");

	  while (resultSet.next()) {
	    List<Object> values = getRowValues(resultSet);
	    stringBuffer.append(new ColumnList(types, values).toString()).append("\n");
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
   * Collects values of one row from current position of specified result set.
   *
   * @param resultSet the source of values
   * @return list with values of one row from current position of specified resultSet
   * @throws SQLException if result set is not available.
   */
  public static List<Object> getRowValues(ResultSet resultSet) throws SQLException {
    int columnCount = resultSet.getMetaData().getColumnCount();
    List<Object> values = new ArrayList<>();
    for (int i = 1; i <= columnCount; i++) {
      try {
        switch (resultSet.getMetaData().getColumnType(i)) {
          case Types.BINARY:
          case Types.VARBINARY:
            byte[] bytes = resultSet.getBytes(i);
            if (bytes != null) {
              values.add(new String(bytes, StandardCharsets.UTF_8.name()));
            } else {
              values.add(null);
            }
            break;
          case Types.NULL:
            values.add(null);
            break;
          default:
            values.add(resultSet.getObject(i));
        }
      } catch (SQLException | UnsupportedEncodingException e) {
        LOG.error(e.getMessage(), e);
      }
    }
    return values;
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
    builder.append("http://").append(ipAddress).append(":8047/storage/").append(pluginType).append(".json");
    return sendHttpGETRequestGetResponseAsString(builder.toString());
  }

  /**
   * Update storage plugins in directory
   * @param templatePath directory having drill storage plugin templates
   * @throws InterruptedException
   */
  public static void updateDrillStoragePlugins(String templatePath) throws InterruptedException {
    LOG.info("\n>> Path: " + templatePath + "\n");
    File[] templateFiles = new File(templatePath).listFiles();
    for (File templateFile : templateFiles) {
      String filename = templateFile.getName();
      LOG.info(">> Updating File: " + filename);
      String pluginType = filename.substring(0, filename.indexOf('-'));
      boolean isSuccess = Utils.updateDrillStoragePlugin(templateFile.getAbsolutePath(), pluginType, DrillTestDefaults.FS_MODE);
      if(!isSuccess){
        LOG.info(">> Update file " + filename + " failed");
      }
      Thread.sleep(200);
    }
  }

  public static void startMinio() {
    LOG.info("> Starting Apache Minio server\n");
    String cmd = DrillTestDefaults.TEST_ROOT_DIR + "/" + DrillTestDefaults.DRILL_TESTDATA_DIR + "/Datasources/s3minio/minio/run_mn.sh";
    try {
      Runtime.getRuntime().exec(cmd);
    } catch (Throwable e) {
      LOG.warn("Fail to run command " + cmd, e);
    }
  }

  public static void stopMinio() {
    LOG.info("> Stopping Apache Minio server\n");
    String cmd = DrillTestDefaults.TEST_ROOT_DIR + "/" +
            DrillTestDefaults.DRILL_TESTDATA_DIR + "/Datasources/s3minio/minio/stop_mn.sh";
    try {
      Runtime.getRuntime().exec(cmd);
    } catch (Throwable e) {
      LOG.warn("Fail to run command " + cmd, e);
    }
    LOG.info("> Disabling s3minio storage plugin for Minio\n");
    String templatePath = DrillTestDefaults.TEST_ROOT_DIR +
            "/conf/plugin-templates/common/s3minio-storage-plugin.template";

    boolean isSuccess = Utils.disableStoragePlugin(templatePath, "s3minio");
    if(!isSuccess){
      LOG.info(">> Fail to disable s3minio storage plugin for Minio");
    }
  }

  /**
   * Updates storage plugin for drill
   * 
   * @param filename
   *          name of file containing drill storage plugin
   * @param pluginType
   *          type of plugin; e.g.: "dfs", "cp"
   * @return true if operation is successful
   */
  private static boolean updateDrillStoragePlugin(String filename, String pluginType, String fsMode) {
    try {
      String content = getFileContent(filename);
      content = content.replace("localhost", Inet4Address.getLocalHost()
        .getHostAddress());
      if (!fsMode.equals("distributedFS")) {
        content = content.replace("maprfs:", "file:");
        content = content.replaceAll("location\"\\s*:\\s*\"", "location\":\"" + System.getProperty("user.home"));
      }
      return postDrillStoragePlugin(content, pluginType);
    } catch (IOException ex) {
      ex.printStackTrace();
    }
    return false;
  }

  /**
   * Turns off a storage plugin for drill
   *
   * @param filename
   *          name of file containing drill storage plugin
   * @param pluginType
   *          type of plugin; e.g.: "dfs", "cp"
   * @return true if operation is successful
   */
  public static boolean disableStoragePlugin(String filename, String pluginType) {
    try {
      String content = getFileContent(filename)
          .replace("\"enabled\": true", "\"enabled\": false");
      return postDrillStoragePlugin(content, pluginType);
    } catch (IOException ex) {
      ex.printStackTrace();
    }
    return false;
  }

  /**
   * Update drill storage plugin content
   *
   * @param content    string containing drill storage plugin
   * @param pluginType type of plugin; e.g.: "dfs", "cp"
   * @return true if operation is successful
   * @throws Exception
   */
  private static boolean postDrillStoragePlugin(String content, String pluginType) throws IOException {
    StringBuilder builder = new StringBuilder();
    builder.append(protocol + DrillTestDefaults.DRILL_STORAGE_PLUGIN_SERVER + ":" + DrillTestDefaults.DRILL_STORAGE_PLUGIN_SERVER_PORT + "/storage/" + pluginType + ".json");

    HttpPost post = new HttpPost(builder.toString());
    post.setHeader("Content-Type", "application/json");
    post.setEntity(new ByteArrayEntity(content.getBytes("UTF-8")));
    CloseableHttpResponse response = (CloseableHttpResponse) client.execute(post);

    return isResponseSuccessful(response);
  }

  private static String getFileContent(String filename) throws IOException {
    String path = new File(filename).getAbsolutePath();
    byte[] encoded = Files.readAllBytes(Paths.get(path));
    return new String(encoded, "UTF-8");
  }


  /**
   * Send Http GET request and return response as string.
   *
   * @param url
   * @return Http GET response built as string.
   * @throws IOException
   */
  public static String sendHttpGETRequestGetResponseAsString(final String url) throws IOException {
    HttpUriRequest request = new HttpGet(url);
    try (CloseableHttpClient client = HttpClientBuilder.create().build();
         CloseableHttpResponse response = client.execute(request)) {
      return getHttpResponseAsString(response);
    }
  }

  /**
   * Convert HttpResponse to a string.
   *
   * @param response a HttpResponse object.
   * @return HttpResponse as a string.
   * @throws IOException
   */
  public static String getHttpResponseAsString(HttpResponse response) throws IOException {
    BufferedReader reader = new BufferedReader(new InputStreamReader(response
      .getEntity().getContent()));
    StringBuilder builder = new StringBuilder();
    reader.lines().forEach(builder::append);
    return builder.toString();
  }

  /**
   * Builds a Http GET request for getting query profile as JSON.
   * @param ip
   * @param queryId
   * @return
   */
  public static String buildHttpGETProfileRequest(final String ip, final String queryId) {
    StringBuilder sb = new StringBuilder("http://");
    return sb.append(ip)
            .append(":")
            .append(DrillTestDefaults.DRILL_STORAGE_PLUGIN_SERVER_PORT)
            .append("/profiles/")
            .append(queryId)
            .append(".json")
            .toString();
  }

  public static boolean isResponseSuccessful(HttpResponse response) throws IOException {
    return getHttpResponseAsString(response).toLowerCase().contains(
      "\"result\" : \"success\"");
  }

  /**
   * Returns a {@link DrillQueryProfile} instance after sending a Http GET request to
   * a Drillbit, obtaining a response and deserializing the response into a {@link DrillQueryProfile}.
   *
   * @param queryId string query id (see {@link #getQueryID(ResultSet)} for more information.
   * @return {@link DrillQueryProfile} object.
   * @throws IOException
   */
  public static DrillQueryProfile getQueryProfile(final String queryId) throws IOException {
    final String url = Utils.buildHttpGETProfileRequest(DrillTestDefaults.DRILL_STORAGE_PLUGIN_SERVER, queryId);
    final String response = Utils.sendHttpGETRequestGetResponseAsString(url);
    if(response.contains("error")) {
      throw new IOException("Could not get query profile for queryId: " + queryId + ", response: " + response);
    } else {
      return new ObjectMapper()
              .readerFor(DrillQueryProfile.class)
              .readValue(response);
    }
  }

  public static String generateOutputFileName(String inputFileName,
                                        String testId, boolean isPlan) throws IOException {
    File drillOutputDir = new File(DrillTestDefaults.DRILL_OUTPUT_DIR);
    if (!drillOutputDir.exists()) {
      if (!drillOutputDir.mkdir()) {
        LOG.debug("Cannot create directory " + DrillTestDefaults.DRILL_OUTPUT_DIR
            + ".  Using /tmp for drill output");
        DrillTestDefaults.DRILL_OUTPUT_DIR = "/tmp";
      }
    }
    int index = inputFileName.lastIndexOf('/');
    String queryName = inputFileName.substring(index + 1);
    queryName = queryName.split("\\.")[0];
    String outputFileName = DrillTestDefaults.DRILL_OUTPUT_DIR + "/" + testId + "_" + queryName;
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
  
  public static int getNumberOfDrillbits(Connection connection) {
	String query = "select count(*) from sys.drillbits";
	int numberOfDrillbits = 0;
	try {
	  PreparedStatement ps = connection.prepareStatement(query);
	  ResultSet resultSet = ps.executeQuery();
	  resultSet.next();
	  numberOfDrillbits = resultSet.getInt(1);
	} catch (SQLException e) {
		LOG.error(e.getMessage());
		e.printStackTrace();
	}
	return numberOfDrillbits;
  }

  /**
   * Get hostnames of all Drillbits in the cluster.
   *
   * @param connection connection instance to the drill cluster
   * @return a list of hostnames of all Drillbits that form part of the cluster.
   * @throws SQLException
   */
  public static List<String> getDrillbitHosts(Connection connection) throws SQLException {
    final String columnName = "hostname";
    final String query = String.format("select %s from sys.drillbits", columnName);
    PreparedStatement ps = connection.prepareStatement(query);
    List<String> result = new ArrayList<>();
    try(ResultSet resultSet = ps.executeQuery()) {
      while(resultSet.next()) {
        result.add(resultSet.getString(columnName));
      }
    }
    return result;
  }

  /**
   * Apply RM config represented by DrillRMConfig to a specified Drillbit.
   *
   * As a part of this method
   * - Write the config to a temporary file (remove if file exists previously.
   * - Copy the file to specified Drillbit node.
   *
   * @param config
   * @param drillbitHost
   * @throws IOException
   */
  public static synchronized void applyRMConfigToDrillbit(final DrillRMConfig config,
                                             final String drillbitHost) throws IOException {
    final String drillRMConfFilePath = DrillTestDefaults.TEST_ROOT_DIR + "/conf/" + DRILL_RM_OVERRIDE_CONF_FILENAME;

    File drillRMConfFile = new File(drillRMConfFilePath);

    CmdConsOut out;
    if(drillRMConfFile.exists()) {
      LOG.warn(drillRMConfFilePath + " exists! Removing the file");
      if ((out = Utils.execCmd("rm -rf " + drillRMConfFilePath)).exitCode != 0) {
        LOG.error("Could not remove config file " +
                drillRMConfFilePath + "\n\n" +
                out);
        throw new IOException(out.consoleErr);
      }
    }

    try (BufferedWriter writer = new BufferedWriter(new FileWriter(drillRMConfFilePath))) {
      writer.write(DRILL_EXEC_RM_CONFIG_KEY + ":" + config.render());
    }

    final String scpCommand = new StringBuilder("scp ")
            .append(drillRMConfFilePath)
            .append(" ")
            .append(USERNAME)
            .append("@").append(drillbitHost)
            .append(":").append(DRILL_HOME)
            .append("/conf/")
            .append(DRILL_RM_OVERRIDE_CONF_FILENAME)
            .toString();

    LOG.info("Copying config " + scpCommand);
    if ((out = Utils.execCmd(scpCommand)).exitCode != 0) {
      LOG.error("Copying config to drillbit failed!\n\n" + out);
      throw new IOException(out.consoleErr);
    }
  }

  public static boolean sanityTest(Connection connection) {
    String query = "SELECT count(*) FROM cp.`employee.json`";
    int rowCount = 0;
    try {
      PreparedStatement ps = connection.prepareStatement(query);
      ResultSet resultSet = ps.executeQuery();
      resultSet.next();
      rowCount = resultSet.getInt(1);
    } catch (SQLException e) {
      LOG.error(e.getMessage());
      e.printStackTrace();
    }
    return rowCount==1155;
  }
  

  public static CmdConsOut execCmd(String cmd){
	return ShellRunner.INSTANCE.execCmd(cmd);
  }
  
  public static ResultSet execSQL(String sql, Connection connection) throws SQLException {
	try {
	  Statement statement = connection.createStatement();
      return statement.execute(sql) ? statement.getResultSet() : null;
	} catch (SQLException e) {
	  LOG.error(e.getMessage());
	  e.printStackTrace();
      try {
		connection.close();
	  } catch (SQLException e1) {
		LOG.error(e.getMessage());
		e1.printStackTrace();
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

  /* Get query ID.  This matches the profile ID */
  public static String getQueryID(ResultSet resultSet) throws SQLException {
    org.apache.drill.jdbc.DrillResultSet drs = (org.apache.drill.jdbc.DrillResultSet)resultSet;
    String queryId = null;
    if (drs != null) {
      try {
        queryId = drs.getQueryId();
      } catch (SQLException e) {
        LOG.info ("getQueryId threw SQLException: " + e.getMessage());
      }
    }
    return queryId;
  }

  /* Remove new lines in a varchar except within quotes */
  public static String removeNewLines(String input) {
    List<String> newStrings = Lists.newArrayList();
    boolean inQuotes = false;
    int start = 0;
    int stringLength = input.length();
    for (int index = 0; index < stringLength; index++) {
      if (input.charAt(index) == '\"') {
        inQuotes = !(inQuotes);
      }
      if (index == stringLength-1) {
        newStrings.add(input.substring(start,stringLength));
      } else if ((input.charAt(index) == '\n') && !(inQuotes)) {
        newStrings.add(input.substring(start,index));
        start = index + 1;
      }
    }
    StringBuilder builder = new StringBuilder();
    for (String s : newStrings) {
      builder.append(s);
    }
    return builder.toString();
  }

  public static boolean matches(String actual, String expected) {
    actual = actual.trim();
    expected = expected.trim();
      Matcher matcher = Pattern.compile(expected).matcher(actual);
      if (!matcher.find()) {
        return false;
      }
    return true;
  }

  public static String getFrameworkVersion() {
    String commitID = "";
    String commitAuthor = "";
    String commitEmail = "";
    String commitMessage = "";
    try {
      URL u = Resources.getResource("git.properties");
      if (u != null) {
        Properties p = new Properties();
        p.load(Resources.asByteSource(u).openStream());
        commitID = p.getProperty("git.commit.id");
        commitAuthor = p.getProperty("git.commit.user.name");
        commitEmail = p.getProperty("git.commit.user.email");
        commitMessage = p.getProperty("git.commit.message.short");
      }
    } catch (IOException | IllegalArgumentException e) {
      LOG.warn("Failure while trying to load \"git.properties\" file.", e);
    }
    return String.format("Commit: %s\nAuthor: %s <%s>\n\n%s", commitID, commitAuthor, commitEmail, commitMessage);
  }
}
