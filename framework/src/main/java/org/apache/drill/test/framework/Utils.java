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
import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.PropertyResourceBundle;
import java.util.ResourceBundle;

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
public class Utils {
  private static final String DRILL_TEST_CONFIG = "drillTestConfig";
  protected static final Logger LOG = Logger.getLogger(Utils
      .getInvokingClassName());

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
   * Returns the map containing all properties in the drill test properties
   * file.
   * 
   * @param drillPropertiesFilename
   *          name of drill properties file
   * @return map containing all properties in the drill test properties file.
   */
  public static Map<String, String> getDrillTestProperties() {
    Map<String, String> drillProperties = new HashMap<String, String>();
    //ResourceBundle bundle = ResourceBundle.getBundle(DRILL_TEST_CONFIG);
    ResourceBundle bundle = null;
    try {
      bundle = new PropertyResourceBundle(new FileInputStream(System.getProperty("user.home") + "/." +
          DRILL_TEST_CONFIG));
    } catch (IOException e) {
        bundle = ResourceBundle.getBundle(DRILL_TEST_CONFIG);
    }
    Enumeration<String> keys = bundle.getKeys();
    while (keys.hasMoreElements()) {
      String key = keys.nextElement();
      if (key != null) {
        drillProperties.put(key.trim(), bundle.getString(key).trim());
      }
    }
    return drillProperties;
  }

  /**
   * Returns name of invoking class.
   * 
   * @return name of invoking class.
   */
  public static String getInvokingClassName() {
    return new Throwable().getStackTrace()[1].getClassName();
  }

  /**
   * Constructs resolved path for a file. If the file starts with "/", it is
   * assumed to already be an absolute path.
   * 
   * @param filename
   *          name of file for which absolute path is being constructed.
   * @param propertyKey
   *          name of property to resolve absolute path from.
   * @return absolute path for a file.
   */
  public static String getAbsolutePath(String filename, String propertyKey) {
    if (filename.startsWith("/")) {
      return filename;
    }
    return Utils.getDrillTestProperties().get(propertyKey) + "/" + filename;
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

  private static final Map<Integer, String> getSqlTypesMap()
      throws IllegalArgumentException, IllegalAccessException {
    Map<Integer, String> map = new HashMap<Integer, String>();
    Field[] fields = Types.class.getDeclaredFields();
    for (int i = 0; i < fields.length; i++) {
      map.put((Integer) fields[i].get(Types.class), fields[i].getName());
    }
    return map;
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
    List<String> typesInStrings = new ArrayList<String>();
    Map<Integer, String> map = getSqlTypesMap();
    for (int i = 0; i < typesInInteger.size(); i++) {
      Integer type = (Integer) typesInInteger.get(i);
      typesInStrings.add(map.get(type));
    }
    return typesInStrings;
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
      String pluginType) throws Exception {
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
      String ipAddress, String pluginType, String fsMode) throws Exception {
    String content = getFileContent(filename);
    content = content.replace("localhost", Inet4Address.getLocalHost()
        .getHostAddress());
    if (fsMode.equals(TestDriver.LOCALFS)) {
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
      String ipAddress, String pluginType) throws Exception {
      StringBuilder builder = new StringBuilder();
      builder.append("http://" + ipAddress + ":8047/storage/" + pluginType);
      HttpPost post = new HttpPost(builder.toString() + ".json");
      post.setHeader("Content-Type", "application/json");
      post.setEntity(new StringEntity(content));
      DefaultHttpClient client = new DefaultHttpClient();
      HttpResponse response = client.execute(post);
      return isResponseSuccessful(response);
  }

  private static String getFileContent(String filename) throws Exception {
    String path = new File(filename).getAbsolutePath();
    byte[] encoded = Files.readAllBytes(Paths.get(path));
    return new String(encoded, "UTF-8");
  }

  private static String getHttpResponseAsString(HttpResponse response)
      throws Exception {
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

  private static boolean isResponseSuccessful(HttpResponse response)
      throws Exception {
    return getHttpResponseAsString(response).toLowerCase().contains(
        "\"result\" : \"success\"");
  }

  public static String generateOutputFileName(String inputFileName,
                                        String testId, boolean isPlan) throws IOException {
    String drillOutputDirName = TestDriver.drillOutputDirName;
    if (drillOutputDirName == null) {
      drillOutputDirName = "/tmp";
    }
    File drillOutputDirDir = new File(drillOutputDirName);
    if (!drillOutputDirDir.exists()) {
      if (!drillOutputDirDir.mkdir()) {
        LOG.debug("Cannot create directory " + drillOutputDirName
            + ".  Using /tmp for drill output");
        drillOutputDirName = "/tmp";
      }
    }
    int index = inputFileName.lastIndexOf('/');
    String queryName = inputFileName.substring(index + 1);
    queryName = queryName.split("\\.")[0];
    String outputFileName = drillOutputDirName + "/" + testId + "_" + queryName;
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
}
