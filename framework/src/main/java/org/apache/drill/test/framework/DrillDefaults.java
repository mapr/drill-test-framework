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

import java.util.Map;

public interface DrillDefaults {
	/**
	 * Default drill home directory.
	 */
	static final String DRILL_HOME = "/opt/drill";
	
	/**
	 * Defines drill running on HDFS or local filesystem.
	 */
	static final String FS_MODE = "distributedFS";
	
	/**
	 * Default line break for logging.
	 */
	static final String LINE_BREAK = "----------------------------------------------------------------------------------------------------------------\n";

	/**
	 * Default location storing drill query output files. By default, only failed query
	 * output file is saved.
	 */
	static final String DRILL_OUTPUT_DIR = "drill-output";
	
	/**
	 * Default directory storing test data.
	 */
	static final String DRILL_TESTDATA = "/drill/testdata";
	
	static final String DRILL_TESTDATA_DIR = "framework/resources";
	/**
	 * Default configuration file name.
	 */
	static final String DRILL_TEST_CONFIG = "drillTestConfig.properties";
	
	/**
	 * Default JDBC driver.
	 */
	static final String JDBC_DRIVER = "org.apache.drill.jdbc.Driver";
	
	/**
	 * Default Drill JDBC driver classpath.
	 */
	static final String JDBC_DRIVER_CP = DRILL_HOME + "/jars/jdbc-driver/*";
	
	/**
	 * Default connection string.
	 */
	static final String CONNECTION_STRING = "jdbc:drill:drillbit=localhost";
			
	/**
	 * Default storage plugin server.
	 */
	static final String DRILL_STORAGE_PLUGIN_SERVER = "localhost";
	
	/**
	 * Default test report directory on local filesystem.
	 */
	static final String DRILL_REPORTS_DIR = "drill-reports";
	
	/**
	 * Default test report directory on HDFS.
	 */
	static final String DRILL_REPORTS_DFS_DIR = "/drill/reports";
	
	/**
	 * Current working directory.
	 */
	static final String CWD = System.getProperty("user.dir");
	
	/**
	 * Default user connecting to drill as.
	 */
	static final String USERNAME = "root";
	
	/**
	 * Default password.
	 */
	static final String PASSWORD = "password";
	
	/**
	 * Default drill restart script name.
	 */
	static String RESTART_DRILL_SCRIPT = "restart_drill_script";
}