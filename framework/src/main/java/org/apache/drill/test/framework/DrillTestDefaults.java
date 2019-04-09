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

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Maps;
import org.junit.Assert;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Map;
import java.util.PropertyResourceBundle;
import java.util.ResourceBundle;

public class DrillTestDefaults {

  // Default configuration file name.
  public static final String DRILL_TEST_CONFIG = "drillTestConfig.properties";

  // Default drill home directory.
  public static String DRILL_HOME = "/opt/drill";

  // Defines drill running on HDFS or local filesystem.
  public static String FS_MODE = "distributedFS";

  // Default directory storing test data on dfs.
  public static String DRILL_TESTDATA = "/drill/testdata";

  // Default location storing drill query output files. By default, only failed query output file is saved.
  public static String DRILL_OUTPUT_DIR = "drill-output";

  // Default directory having test cases.
  public static String DRILL_TESTDATA_DIR = "framework/resources";

  // Default test report directory on local filesystem.
  public static String DRILL_REPORTS_DIR = "drill-reports";

  // Default test report directory on HDFS.
  public static String DRILL_REPORTS_DFS_DIR = "/drill/reports";

  // Default JDBC driver.
  public static String JDBC_DRIVER = "org.apache.drill.jdbc.Driver";

  // Default connection string.
  public static String CONNECTION_STRING = "jdbc:drill:drillbit=localhost";

  // Default storage plugin server.
  public static String DRILL_STORAGE_PLUGIN_SERVER = "localhost";

  // Web server port
  public static int DRILL_STORAGE_PLUGIN_SERVER_PORT = 8047;

  // Current working directory.
  public static final String CWD = System.getProperty("user.dir");

  // Drill Test root directory, CWD changes to test-root/framework for testng
  public static final String TEST_ROOT_DIR = CWD + (CWD.endsWith("/framework") ? "/../" : "");

  // Default user connecting to drill as.
  public static String USERNAME = "root";

  // Default password.
  public static String PASSWORD = "password";

  // Default drill restart script name.
  public static String RESTART_DRILL_SCRIPT = "restart_drill_script";

  // Authentication mechanism.
  public static String AUTHENTICATION_MECHANISM = "";

  // Indicates if SSL authentication is required.
  public static boolean SSL_ENABLED = false;

  // Truststore location.
  public static String TRUSTSTORE_PATH = "";

  // Truststore password.
  public static String TRUSTSTORE_PASSWORD = "";

  // Indicates if HTTPS is enabled.
  public static boolean HTTPS_ENABLED = false;

  // Default number of cluster nodes.
  public static int NUMBER_OF_CLUSTER_NODES = 0;

  // Kerberos principal
  public static String KERBEROS_PRINCIPAL = "";

  // Is secure cluster enabled
  public static boolean IS_SECURE_CLUSTER = false;

  // Default line break for logging.
  static final String LINE_BREAK = "------------------------------------------------------------------------";

  //Drill RM config key
  public static final String DRILL_EXEC_RM_CONFIG_KEY = "drill.exec.rm";

  public static final String DRILL_RM_OVERRIDE_CONF_FILENAME = "drill-rm-override.conf";

  public static final long DEFAULT_SLEEP_IN_MILLIS = 20000; //default sleep

  // Adding classifications for Execution Failures
  public static enum DRILL_EXCEPTION{
       VALIDATION_ERROR_INVALID_SCHEMA,
       VALIDATION_ERROR_OBJECT_NOT_FOUND,
       INTERNAL_ERROR,
       SQL_EXCEPTION_CONNECTION_ERROR,
       ALREADY_CLOSED_SQL_EXCEPTION,
       SQL_EXCEPTION_RESOURCE_ERROR,
       ARRAY_INDEX_OUT_OF_BOUNDS_EXCEPTION,
       UNSUPPORTED_OPERATION_EXCEPTION,
       SYSTEM_ERROR_ILLEGAL_EXCEPTION,
       SYSTEM_ERROR_ILLEGAL_ARGUMENT_EXCEPTION,
       SYSTEM_ERROR_CHANNEL_CLOSED_EXCEPTION,
       NULL_POINTER_EXCEPTION, 
       UNCATEGORIZED;
  }

  public static final String DRILL_EXCEPTION_REGEXES[] = { "Schema \\[.*\\] is not valid with respect to either root schema or current default schema.*",
							   "Object .* not found.*",
							   "INTERNAL_ERROR ERROR.*",
							   ".*SQLException.*CONNECTION ERROR.*",
							   ".*ResultSet.*closed.*",
							   "Not enough memory.*",
							   "ArrayIndexOutOfBoundsException.*",
							   "UnsupportedOperationException.*",
							   ".*SYSTEM ERROR.*IllegalStateException.*",
							   ".*SYSTEM ERROR.*IllegalArgumentException.*",
							   ".*SYSTEM ERROR.*ChannelClosedException.*",
							   ".*NullPointerException.*",
							   "Uncategorized"
							};
   
  private static final Map<String, String> drillProperties;

  static {
    drillProperties = getConfigProperties();
    loadConfigProperties();
  }

  public static Map<String, String> getDrillProperties() {
    return drillProperties;
  }

  /**

   * Reads properties from drill test configuration file
   * @return drill test configuration properties
   */
  private static Map<String, String> getConfigProperties() {
    final Map<String, String> properties = Maps.newHashMap();

    //CWD can be {basePath}/drill-test-framework or {basePath}/drill-test-framework/framework
    final File overrideFile = new File(TEST_ROOT_DIR + "/conf/"  + DRILL_TEST_CONFIG);

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
    return ImmutableMap.copyOf(properties);
  }

  /**
   * Load configuration properties
   */
  private static void loadConfigProperties() {
    DRILL_HOME = drillProperties.containsKey("DRILL_HOME") ?
      drillProperties.get("DRILL_HOME") : DRILL_HOME;

    FS_MODE = drillProperties.containsKey("FS_MODE") ?
      drillProperties.get("FS_MODE") : FS_MODE;

    if (FS_MODE.equals("distributedFS")) {
      DRILL_TESTDATA = drillProperties.containsKey("DRILL_TESTDATA") ?
        drillProperties.get("DRILL_TESTDATA") : DRILL_TESTDATA;
    } else {
      DRILL_TESTDATA = System.getProperty("user.home") + DRILL_TESTDATA;
    }

    DRILL_TESTDATA_DIR = drillProperties.containsKey("DRILL_TEST_DATA_DIR") ?
      drillProperties.get("DRILL_TEST_DATA_DIR") : DRILL_TESTDATA_DIR;

    DRILL_OUTPUT_DIR = drillProperties.containsKey("DRILL_OUTPUT_DIR") ?
      drillProperties.get("DRILL_OUTPUT_DIR") : DRILL_OUTPUT_DIR;

    DRILL_REPORTS_DIR = drillProperties.containsKey("DRILL_REPORTS_DIR") ?
      drillProperties.get("DRILL_REPORTS_DIR") : DRILL_REPORTS_DIR;

    DRILL_REPORTS_DFS_DIR = drillProperties.containsKey("DRILL_REPORTS_DFS_DIR") ?
      drillProperties.get("DRILL_REPORTS_DFS_DIR") : DRILL_REPORTS_DFS_DIR;

    JDBC_DRIVER = drillProperties.containsKey("JDBC_DRIVER") ?
      drillProperties.get("JDBC_DRIVER") : JDBC_DRIVER;

    CONNECTION_STRING = drillProperties.containsKey("CONNECTION_STRING") ?
      drillProperties.get("CONNECTION_STRING") : CONNECTION_STRING;

    DRILL_STORAGE_PLUGIN_SERVER = drillProperties.containsKey("DRILL_STORAGE_PLUGIN_SERVER") ?
      drillProperties.get("DRILL_STORAGE_PLUGIN_SERVER") : DRILL_STORAGE_PLUGIN_SERVER;

    DRILL_STORAGE_PLUGIN_SERVER_PORT = drillProperties.containsKey("DRILL_STORAGE_PLUGIN_SERVER_PORT") ?
      Integer.parseInt(drillProperties.get("DRILL_STORAGE_PLUGIN_SERVER_PORT")) : DRILL_STORAGE_PLUGIN_SERVER_PORT;

    USERNAME = drillProperties.containsKey("USERNAME") ?
      drillProperties.get("USERNAME") : USERNAME;

    PASSWORD = drillProperties.containsKey("PASSWORD") ?
      drillProperties.get("PASSWORD") : PASSWORD;

    RESTART_DRILL_SCRIPT = drillProperties.containsKey("RESTART_DRILL_SCRIPT") ?
      drillProperties.get("RESTART_DRILL_SCRIPT") : RESTART_DRILL_SCRIPT;

    AUTHENTICATION_MECHANISM = drillProperties.containsKey("AUTH_MECHANISM") ?
      drillProperties.get("AUTH_MECHANISM").toUpperCase() : "";

    SSL_ENABLED = drillProperties.containsKey("SSL_ENABLED") &&
      Boolean.parseBoolean(drillProperties.get("SSL_ENABLED"));

    if (SSL_ENABLED) {
      TRUSTSTORE_PATH = drillProperties.containsKey("TRUSTSTORE_PATH") ? drillProperties.get("TRUSTSTORE_PATH") : "";
      TRUSTSTORE_PASSWORD = drillProperties.containsKey("TRUSTSTORE_PASSWORD") ? drillProperties.get("TRUSTSTORE_PASSWORD") : "";

      Assert.assertFalse("Truststore location not provided", DrillTestDefaults.TRUSTSTORE_PATH.isEmpty());
      Assert.assertFalse("Truststore password not provided", DrillTestDefaults.TRUSTSTORE_PASSWORD.isEmpty());
    }

    HTTPS_ENABLED = drillProperties.containsKey("HTTPS_ENABLED") &&
      Boolean.parseBoolean(drillProperties.get("HTTPS_ENABLED"));

    NUMBER_OF_CLUSTER_NODES = drillProperties.containsKey("NUMBER_OF_CLUSTER_NODES") ?
      Integer.parseInt(drillProperties.get("NUMBER_OF_CLUSTER_NODES")) : 0;

    if (AUTHENTICATION_MECHANISM == "KERBEROS") {
      KERBEROS_PRINCIPAL = drillProperties.containsKey("KERBEROS_PRINCIPAL") ?
        drillProperties.get("KERBEROS_PRINCIPAL") : KERBEROS_PRINCIPAL;

      Assert.assertFalse("Kerberos principal not provided", DrillTestDefaults.KERBEROS_PRINCIPAL.isEmpty());
    }

    IS_SECURE_CLUSTER = drillProperties.containsKey("IS_SECURE_CLUSTER") &&
      Boolean.parseBoolean(drillProperties.get("IS_SECURE_CLUSTER"));
  }

}
