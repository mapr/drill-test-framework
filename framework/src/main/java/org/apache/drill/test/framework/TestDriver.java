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

import com.beust.jcommander.JCommander;
import com.beust.jcommander.Parameter;
import com.beust.jcommander.ParameterException;
import com.google.common.base.Stopwatch;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import org.apache.drill.test.framework.TestCaseModeler.DataSource;
import org.apache.drill.test.framework.TestVerifier.TestStatus;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.FileUtil;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.mapred.FileAlreadyExistsException;
import org.apache.log4j.Logger;
import org.ojai.Document;
import org.ojai.json.Json;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.sql.DatabaseMetaData;

public class TestDriver implements DrillDefaults {
  private static final Logger LOG = Logger.getLogger(TestDriver.class);
  private Connection connection = null;
  public static String commitId, version, drillHome, fsMode;
  public static String drillTestData, drillTestDataDir, drillOutputDir, drillStoragePluginServer;
  public static String jdbcDriver, jdbcDriverCP, connectionString;
  public static String drillReportsDir, drillReportsDFSDir, username, password, restartDrillScript;
  private String[] injectionKeys = {"DRILL_VERSION"};
  public static Map<String,String> injections = Maps.newHashMap();
  private long [][] memUsage = new long[2][3];
  private String memUsageFilename = null;
  private ConnectionPool connectionPool;
 
  private static Configuration conf = new Configuration();
  public static final CmdParam cmdParam = new CmdParam();

  static {loadConf();};
  
  public TestDriver() {
	  connectionPool = new ConnectionPool(jdbcDriver);
  }
  
  public static void main(String[] args) throws Exception {
    JCommander jc = new JCommander(cmdParam);
    jc.setProgramName("TestDriver");
    try {
      jc.parse(args);
      
    } catch (ParameterException e) {
      System.out.println("\n" + e.getMessage() + "\n");
      jc.usage();
      System.exit(-1);
    }
    if (cmdParam.help) {
      jc.usage();
      System.exit(0);
    }

    final Stopwatch stopwatch = Stopwatch.createStarted();
    int errorCode;
    try {
      LOG.info(LINE_BREAK + LINE_BREAK);
      LOG.info("STARTING AT " + new Date());
      LOG.info(LINE_BREAK);
      errorCode = new TestDriver().runTests();
    } catch (Exception e) {
      LOG.error("Exiting due to uncaught exception", e);
      errorCode = -1;
    } finally {
      LOG.info(LINE_BREAK);
      LOG.info("FINISHED AT " + new Date());
      LOG.info("TOTAL DURATION: " + stopwatch);
      LOG.info(LINE_BREAK + LINE_BREAK);
    }
    System.exit(errorCode);
  }



  public int runTests() throws Exception {
	CancelingExecutor executor = new CancelingExecutor(cmdParam.threads, cmdParam.timeout);

    final Stopwatch stopwatch = Stopwatch.createStarted();
    LOG.info("> Pre-check..");
    try {
		connection = connectionPool.getOrCreateConnection(username,password);
	} catch (SQLException e) {
		e.printStackTrace();
		System.exit(-1);
	}
    
    //Record JDBC driver name and version
    DatabaseMetaData dm = connection.getMetaData();
    LOG.info(LINE_BREAK + "Product name = " + dm.getDatabaseProductName() + "\n"
    		 + "Product version = " + dm.getDatabaseProductVersion() + "\n"
    		 + "Product major version = " + dm.getDatabaseMajorVersion() + "\n"
    		 + "Product minor version = " + dm.getDatabaseMinorVersion() + "\n"
    		 + "Driver name = " + dm.getDriverName() + "\n"
    		 + "Driver version = " + dm.getDriverVersion() + "\n"
    		 + "Driver major version = " + dm.getDriverMajorVersion() + "\n"
    		 + "Driver minor version = " + dm.getDriverMinorVersion() + "\n" + LINE_BREAK);
    
    //Check number of drillbits equals number of cluster nodes    
    int numberOfDrillbits = Utils.getNumberOfDrillbits(connection);
    connectionPool.releaseConnection(username,password, connection);
    int numberOfClusterNodes = Utils.getNumberOfClusterNodes();
    if (numberOfClusterNodes != 0 && numberOfClusterNodes != numberOfDrillbits) {
    	LOG.error("\nPrecheck failed!\n\tNumber of cluster nodes = "
    			+ numberOfClusterNodes + ";\n\tnumber of drillbits = " + numberOfDrillbits);
    	System.exit(-1);
    }
    LOG.info("Number of cluster nodes configured = " + numberOfClusterNodes);
    LOG.info("Number of drillbits running = " + numberOfDrillbits);
    LOG.info("> TOOK " + stopwatch + " TO do pre-check.");
    
    stopwatch.reset().start();
    LOG.info("> SETTING UP..");
    setup();

    List<DrillTestCase> drillTestCases = Utils.getDrillTestCases();
    List<DrillTest> tests = Lists.newArrayList();
    for (DrillTestCase testCase : drillTestCases) {
      for (int clone = 0; clone < cmdParam.clones; clone++) {
        tests.add(getDrillTest(testCase, connectionPool, clone));
      }
    }

    int totalPassingTest = 0;
    int totalExecutionFailure = 0;
    int totalVerificationFailure = 0;
    int totalCanceledTest = 0;
    int totalTimeoutFailure = 0;
    int i = 0;
    LOG.info("> TOOK " + stopwatch + " TO SETUP.");

    if (cmdParam.trackMemory) {
  	  queryMemoryUsage();
    }

    for (i = 1; i < cmdParam.iterations+1; i++) {
      stopwatch.reset().start();
      LOG.info("> PREPARING DATA..");
      if (cmdParam.generate) {
        prepareData(drillTestCases);
      }
      LOG.info("> TOOK " + stopwatch + " TO PREPARE DATA.");
      stopwatch.reset().start();

      LOG.info("> RUNNING TESTS (ITERATION " + i + ")..");
      Collections.shuffle(tests, new Random());
      executor.executeAll(tests);

      if (cmdParam.trackMemory) {
    	  queryMemoryUsage();
      }

      List<DrillTest> passingTests = Lists.newArrayList();
      List<DrillTest> verificationFailures = Lists.newArrayList();
      List<DrillTest> executionFailures = Lists.newArrayList();
      List<DrillTest> timeoutFailures = Lists.newArrayList();
      List<DrillTest> canceledTests = Lists.newArrayList();

      for (DrillTest test : tests) {
        TestStatus testStatus = test.getTestStatus();
        switch (testStatus) {
        case PASS:
          passingTests.add(test);
          break;
        case VERIFICATION_FAILURE:
          verificationFailures.add(test);
          break;
        case EXECUTION_FAILURE:
          executionFailures.add(test);
          break;
        case TIMEOUT:
          timeoutFailures.add(test);
          break;
        case CANCELED:
          canceledTests.add(test);
          break;
        default:
          executionFailures.add(test);
        }
      }
      LOG.info(LINE_BREAK + LINE_BREAK);
      LOG.info("Tests completed for iteration " + i + " in " + stopwatch);
      LOG.info(LINE_BREAK + LINE_BREAK);
      LOG.info("Results:");
      LOG.info(LINE_BREAK);
      LOG.info("Execution Failures:");
      if(cmdParam.generateReports) {
        LOG.info("Generating reports");
        generateReports(tests, i);
      }
      for (DrillTest test : executionFailures) {
        LOG.info(test.getInputFile());
        LOG.info("Query: \n" + test.getQuery());
        LOG.info("Failed with exception", test.getException());
      }
      LOG.info("Verification Failures:");
      for (DrillTest test : verificationFailures) {
        LOG.info(test.getInputFile());
        LOG.info("Query: \n" + test.getQuery());
        LOG.info(test.getException().getMessage());
      }
      LOG.info("Timeout Failures:");
      for (DrillTest test : timeoutFailures) {
        LOG.info(test.getInputFile());
        LOG.info("Query: \n" + test.getQuery());
      }
      LOG.info(LINE_BREAK);
      LOG.info("Summary");
      LOG.info(LINE_BREAK);
      LOG.info("Execution Failures:");
      for (DrillTest test : executionFailures) {
        LOG.info(test.getInputFile());
      }
      LOG.info("Verification Failures:");
      for (DrillTest test : verificationFailures) {
        LOG.info(test.getInputFile());
      }
      LOG.info("Timeout Failures:");
      for (DrillTest test : timeoutFailures) {
        LOG.info(test.getInputFile());
      }
      LOG.info(LINE_BREAK);
      LOG.info(String.format("\nPassing tests: %d\nExecution Failures: %d\nVerificationFailures: %d" +
      	"\nTimeouts: %d\nCanceled: %d", passingTests.size(), executionFailures.size(), 
      	verificationFailures.size(), timeoutFailures.size(), canceledTests.size()));
      
      if (cmdParam.trackMemory) {
    	LOG.info(LINE_BREAK);
    	LOG.info(String.format("\nMemory Consumption:\n\t\theap(M)\t\tdirect(M)\tjvm_direct(M)\n" +
    			"  before:\t%d\t\t%d\t\t%d\n  after:\t%d\t\t%d\t\t%d", memUsage[0][0], memUsage[0][1], memUsage[0][2],
    			memUsage[1][0], memUsage[1][1], memUsage[1][2]));
      }

      totalPassingTest += passingTests.size();
      totalExecutionFailure += executionFailures.size();
      totalVerificationFailure += verificationFailures.size();
      totalTimeoutFailure += timeoutFailures.size();
      totalCanceledTest += canceledTests.size(); 
    }

    if (i > 2) {
      LOG.info(LINE_BREAK);
      LOG.info(String.format("\nCompleted %d iterations.\n  Passing tests: %d\n  Execution Failures: %d\n  VerificationFailures: %d" +
    	  "\n  Timeouts: %d\n  Canceled: %d", i-1, totalPassingTest, totalExecutionFailure, 
    	  totalVerificationFailure, totalTimeoutFailure, totalCanceledTest));
      LOG.info("\n> TEARING DOWN..");
    }
    teardown();
    executor.close();
    connectionPool.close();
    restartDrill();

    return totalExecutionFailure + totalVerificationFailure + totalTimeoutFailure;
  }

  public void setup() throws IOException, InterruptedException {
    if (!new File(drillOutputDir).exists()) {
      new File(drillOutputDir).mkdir();
    }

    String templatePath = CWD + "/conf/plugin-templates/";
    LOG.info(templatePath);
    File[] templateFiles = new File(templatePath).listFiles();
    for (File templateFile : templateFiles) {
      String filename = templateFile.getName();
      String pluginType = filename.substring(0, filename.indexOf('-'));
      Utils.updateDrillStoragePlugin(templateFile.getAbsolutePath(),
    		drillStoragePluginServer, pluginType, fsMode);
      Thread.sleep(200);
    }
    
    String beforeRunQueryFilename = CWD + "/" + cmdParam.beforeRunQueryFilename;
    try {
      String[] setupQueries = Utils.getSqlStatements(beforeRunQueryFilename);
      connection = connectionPool.getOrCreateConnection(username ,password);
      for (String query : setupQueries) {
        LOG.info(Utils.getSqlResult(Utils.execSQL(query, connection)));
      }
      
      String getCommitId = "SELECT version, commit_id from sys.version";
      ResultSet resultSet = Utils.execSQL(getCommitId, connection);
      while(resultSet.next()) {
        commitId = resultSet.getString("commit_id");
        version = resultSet.getString("version");
      }
      
      //setup injection map
      for (int i = 0; i < injectionKeys.length; i++) {
    	switch (injectionKeys[i]) {
    	case "DRILL_VERSION":
    	  injections.put(injectionKeys[i], version);
    	  break;
    	default:
    	  LOG.fatal("Injection parameter not recognized!");
    	}    	
      }

      connectionPool.releaseConnection(username, password, connection);
    } catch (IOException e) {
      LOG.warn("WARNING: " + beforeRunQueryFilename + " file does not exist.\n");
    } catch (SQLException e) {
		e.printStackTrace();
		try {
			connection.close();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	}
    Thread.sleep(1000);
  }
  
  private void teardown() {
	String afterRunQueryFilename = CWD + "/" + cmdParam.afterRunQueryFilename;
	try {
	  connection = connectionPool.getOrCreateConnection(username, password);
	  String[] teardownQueries = Utils.getSqlStatements(afterRunQueryFilename);
      for (String query : teardownQueries) {
        LOG.info(Utils.getSqlResult(Utils.execSQL(query, connection)));
      }
    } catch (IOException e) {
      LOG.warn("WARNING: " + afterRunQueryFilename + " file does not exist.\n");
    } catch (SQLException e) {
		e.printStackTrace();
		try {
			connection.close();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	} 
	connectionPool.releaseConnection(username,password, connection);
  }

  private void prepareData(List<DrillTestCase> tests) throws Exception {
    Set<DataSource> dataSources = new HashSet<>();
    for (TestCaseModeler test : tests) {
      List<DataSource> dataSourceList = test.datasources;
      if (dataSourceList != null) {
        dataSources.addAll(test.datasources);
      }
    }

    boolean restartDrillbits = false;

    CancelingExecutor copyExecutor = new CancelingExecutor(cmdParam.threads, Integer.MAX_VALUE);
    CancelingExecutor genExecutor = new CancelingExecutor(cmdParam.threads, Integer.MAX_VALUE);
    List<Cancelable> copyTasks = Lists.newArrayList();
    List<Cancelable> genTasks = Lists.newArrayList();
    for (final TestCaseModeler.DataSource datasource : dataSources) {
      String mode = datasource.mode;
      if (mode.equals("cp")) {
        Cancelable task = new Cancelable() {
          @Override
          public void cancel() {
            // no op, as this will not time out
          }

          @Override
          public void run() {
            try {
              Path src = new Path(CWD + "/" + drillTestDataDir + "/" + datasource.src);
              Path dest = new Path(drillTestData, datasource.dest);
              dfsCopy(src, dest, fsMode);
            } catch (IOException e) {
              throw new RuntimeException(e);
            }
          }
        };
        copyTasks.add(task);
      } else if (mode.equals("gen")) {
        Cancelable task = new Cancelable() {
          @Override
          public void cancel() {
            // no op, as this will not time out
          }

          @Override
          public void run() {
            runGenerateScript(datasource);
          }
        };
        genTasks.add(task);
      } else if (mode.equals("restart-drill")) {
        restartDrillbits = true;
      }
    }

    final Stopwatch stopwatch = Stopwatch.createStarted();
    LOG.info(">> COPYING DATA..");
    copyExecutor.executeAll(copyTasks);
    copyExecutor.close();
    LOG.info(">> TOOK " + stopwatch + " TO COPY DATA.");
    stopwatch.reset().start();
    LOG.info(">> GENERATING DATA..");
    genExecutor.executeAll(genTasks);
    genExecutor.close();
    LOG.info(">> TOOK " + stopwatch + " TO GENERATE DATA.");

    if (restartDrillbits) {
      LOG.info("Restarting drillbits");
      restartDrill();
    }
  }

  private void dfsCopy(Path src, Path dest, String fsMode)
          throws IOException {

    FileSystem fs;
    FileSystem localFs = FileSystem.getLocal(conf);

    if (fsMode.equals("distributedFS")) {
        fs = FileSystem.get(conf);
    } else {
        fs = FileSystem.getLocal(conf);
    }

    try {
      if (localFs.getFileStatus(src).isDirectory()) {
        for (FileStatus file : localFs.listStatus(src)) {
          Path srcChild = file.getPath();
          Path newDest = new Path(dest + "/" + srcChild.getName());
          dfsCopy(srcChild, newDest, fsMode);
        }
      } else {
        if (!fs.exists(dest.getParent())) {
          fs.mkdirs(dest.getParent());
        }
        if (!fs.exists(dest)) {
          FileUtil.copy(localFs, src, fs, dest, false, fs.getConf());
          LOG.debug("Copying file " + src + " to " + dest);
        } else {
          LOG.debug("File " + src + " already exists as " + dest);
        }
      }
    } catch (FileAlreadyExistsException e) {
      LOG.debug("File " + src + " already exists as " + dest);
    } catch (IOException e) {
      LOG.debug("File " + src + " already exists as " + dest);
    }
  }

  private void runGenerateScript(DataSource datasource) {
	String command = CWD + "/" + drillTestDataDir + "/" + datasource.src;
	LOG.info("Running command " + command);
	CmdConsOut cmdConsOut = null;
	try {
	  cmdConsOut = Utils.execCmd(command);
	  LOG.debug(cmdConsOut.consoleOut);
	} catch (Exception e) {
	  LOG.error("Error: Failed to execute the command " + command + ".");
	  throw new RuntimeException(e);
	}
	if (cmdConsOut.exitCode != 0) {
	  throw new RuntimeException("Error executing the command " + command
	          + " has return code " + cmdConsOut.exitCode);
	}
  }
  
  private DrillTest getDrillTest(DrillTestCase modeler, ConnectionPool connectionPool, int cloneId) {
    switch(modeler.submitType) {
    case "jdbc":
      return new DrillTestJdbc(modeler, connectionPool, cloneId);
    case "odbc":
      return new DrillTestOdbc(modeler, cloneId);
    case "script":
      return new DrillTestScript(modeler, cloneId);
    case "system":
      return null;
    default:
      throw new UnsupportedOperationException("Unknown query type: " + modeler.queryType);
    }
  }
  
  private void queryMemoryUsage() throws IOException, SQLException {
	String query = "select sum(heap_current) as heap_current, sum(direct_current) as direct_current, " +
			"sum(jvm_direct_current) as jvm_direct_current from sys.memory";

	if (memUsageFilename == null) {
	  memUsageFilename = Utils.generateOutputFileName(CWD, "/memComsumption", false);
	}
    BufferedWriter writer = new BufferedWriter(new FileWriter(new File(memUsageFilename), true));
    ResultSet resultSet = null;
    try {
      connection = connectionPool.getOrCreateConnection(username, password);
      resultSet = Utils.execSQL(query, connection);

      List columnLabels = new ArrayList<String>();
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
            try {
			  if (resultSet.getMetaData().getColumnType(i) == Types.DATE) {
				values.add(resultSet.getDate(i));
              } else {
				values.add(resultSet.getObject(i));
              }
			} catch (SQLException e1) {
			  LOG.error(e.getMessage());
			  e1.printStackTrace();
			}
          }
        }
        ColumnList columnList = new ColumnList(types, values);
        if (writer != null) {
          writer.write(columnList + "\n");
        }
        for (int i = 0; i < 3; i++) {
          memUsage[0][i] = memUsage[1][i];
          memUsage[1][i] = (Long) values.get(i)/1024/1024;
        }
      }
      connectionPool.releaseConnection(username, password, connection);
    } catch (IllegalArgumentException | IllegalAccessException e1) {
	  e1.printStackTrace();
    } catch (IOException e1) {
	  e1.printStackTrace();
    } catch (SQLException e1) {
      LOG.warn(e1.getMessage());
      e1.printStackTrace();
      connection.close();
    } finally {
      if (resultSet != null) {
        resultSet.close();
      }
      if (writer != null) {
        writer.close();
      }
    }
  }
  
  private static void loadConf() {
	Map<String, String> drillProperties = Utils.drillProperties;
			
	drillHome = drillProperties.containsKey("DRILL_HOME") ?
			drillProperties.get("DRILL_HOME") : DRILL_HOME;
			
	fsMode = drillProperties.containsKey("FS_MODE") ? 
			drillProperties.get("FS_MODE") : FS_MODE;
	    
	drillTestDataDir = drillProperties.containsKey("DRILL_TEST_DATA_DIR") ?
			drillProperties.get("DRILL_TEST_DATA_DIR") : DRILL_TESTDATA_DIR;
			
	if (fsMode.equals("distributedFS")) {
	  drillTestData = drillProperties.containsKey("DRILL_TESTDATA") ? 
			drillProperties.get("DRILL_TESTDATA") : DRILL_TESTDATA;
	} else {
	  drillTestData = System.getProperty("user.home") + drillTestData;
	}
	    
	drillOutputDir = drillProperties.containsKey("DRILL_OUTPUT_DIR") ? 
			drillProperties.get("DRILL_OUTPUT_DIR") : DRILL_OUTPUT_DIR;
	    		
	drillStoragePluginServer = drillProperties.containsKey("DRILL_STORAGE_PLUGIN_SERVER") ?
			drillProperties.get("DRILL_STORAGE_PLUGIN_SERVER") : DRILL_STORAGE_PLUGIN_SERVER;
	    		
	jdbcDriver = drillProperties.containsKey("JDBC_DRIVER") ?
			drillProperties.get("JDBC_DRIVER") : JDBC_DRIVER;
			
	jdbcDriverCP = drillProperties.containsKey("JDBC_DRIVER_CP") ?
			drillProperties.get("JDBC_DRIVER_CP") : JDBC_DRIVER_CP;
			
	connectionString = drillProperties.containsKey("CONNECTION_STRING") ?
			drillProperties.get("CONNECTION_STRING") : CONNECTION_STRING;
			
	drillReportsDir = drillProperties.containsKey("DRILL_REPORTS_DIR") ?
			drillProperties.get("DRILL_REPORTS_DIR") : DRILL_REPORTS_DIR;
	    
	drillReportsDFSDir = drillProperties.containsKey("DRILL_REPORTS_DFS_DIR") ?
			drillProperties.get("DRILL_REPORTS_DFS_DIR") : DRILL_REPORTS_DFS_DIR;

	username = drillProperties.containsKey("USERNAME") ?
			drillProperties.get("USERNAME") : USERNAME;
	    		
	password = drillProperties.containsKey("PASSWORD") ?
			drillProperties.get("PASSWORD") : PASSWORD;
			
	restartDrillScript = drillProperties.containsKey("RESTART_DRILL_SCRIPT") ?
			drillProperties.get("RESTART_DRILL_SCRIPT") : RESTART_DRILL_SCRIPT;
  }

  private void generateReports(List<DrillTest> tests, int iteration) {
    try{
      File drillReportDir = new File(drillReportsDir);
      FileSystem localFS = FileSystem.getLocal(conf);
      FileSystem DFS = FileSystem.get(conf);

      if (!drillReportDir.exists()) {
        if (!drillReportDir.mkdir()) {
          LOG.debug("Cannot create directory " + drillReportsDir
                  + ".  Using current working directory for drill output");
          drillReportsDir = CWD;
        }
      }

      File reportFile = new File(drillReportsDir + "/apache-drill-" + version + "_" + commitId + "_" +
              "report_" + new Date().toString().replace(' ', '_').replace(':','_') + ".json");

      BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(reportFile));
      Document document;
      for (DrillTest test : tests) {
        document = Json.newDocument();
        document.set("_id", test.getTestId()+ "_" + new File(test.getInputFile()).getName() + "_" 
        		+ test.getCloneId() + "_" + iteration);
        document.set("queryFilepath", test.getInputFile().substring(test.getInputFile().indexOf("resources/")+10));
        String query = test.getQuery();
        if(query != null){
          query.replaceAll("\n", "");
        }
        document.set("query", query);
        document.set("status", test.getTestStatus().toString());
        if(test.getTestStatus().equals(TestStatus.EXECUTION_FAILURE) 
        		|| test.getTestStatus().equals(TestStatus.VERIFICATION_FAILURE)) {
          document.set("errorMessage", test.getException().toString().replaceAll("\n",""));
        }else{
          document.set("errorMessage", "N/A");
        }
        document.set("queryExecutionTime", test.getDuration().toString());
        document.set("drillVersion", version);
        document.set("commitId", commitId);
        bufferedWriter.write(document.toString());
        bufferedWriter.newLine();
      }

      bufferedWriter.flush();
      bufferedWriter.close();

      // Upload report to DFS if the DRILL_REPORTS_DFS_DIR variable is set
      if (Utils.drillProperties.containsKey("DRILL_REPORTS_DFS_DIR")){
        FileUtil.copy(localFS, new Path(reportFile.getAbsolutePath()), DFS, 
        		new Path (drillReportsDFSDir + "/" + reportFile.getName()), true, false, DFS.getConf());
      }
    }
    catch(Exception e){
      e.printStackTrace();
    }
  }
  
  private int restartDrill() {
    int exitCode = 0;
    String command = CWD + "/" + restartDrillScript;
    File commandFile = new File(command);
    if (commandFile.exists() && commandFile.canExecute()) {
      LOG.info("Running command: " + command);
      exitCode = Utils.execCmd(command).exitCode;
      if (exitCode != 0) {
        LOG.error("Error executing the command " + command + " has return code " + exitCode);
      }
    } else {
      LOG.error("Restart Drillbit script " + command + " does not exist or can't be executed!");
    }
    return exitCode;
  }
}
