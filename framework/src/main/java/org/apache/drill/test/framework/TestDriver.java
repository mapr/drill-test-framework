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
import org.apache.drill.test.framework.TestCaseModeler.DataSource;
import org.apache.drill.test.framework.TestVerifier.TestStatus;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.log4j.Logger;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;

public class TestDriver {
  public static final String LOCALFS = "local";
  public static final String DFS = "dfs";
  private static final Logger LOG = Logger.getLogger(TestDriver.class);
  private static final String LINE_BREAK = "----------------------------------------------------------------------------------------------------------------";
  protected static Map<String, String> drillProperties = Utils
      .getDrillTestProperties();
  public static final String drillOutputDirName = drillProperties.get("DRILL_OUTPUT_DIR");
  private String restartDrillScript = drillProperties
      .get("RESTART_DRILL_SCRIPT");
  private String ipAddressPlugin = drillProperties
      .get("DRILL_STORAGE_PLUGIN_SERVER");
  private static final String CWD = System.getProperty("user.dir");
  private String drillTestData = drillProperties.get("DRILL_TESTDATA");
  private String fsMode = drillProperties.get("FS_MODE");
  private Connection connection = null;
  private ConnectionPool connectionPool = null;
  private long [][] memUsage = new long[2][3];
  private String memUsageFilename = null;
 
  private static Configuration conf = new Configuration();
  public static final Options OPTIONS = new Options();

  public TestDriver() {
    if (fsMode == null) {
      fsMode = TestDriver.DFS;
    }
    if (fsMode.equals(LOCALFS)) {
      drillTestData = System.getProperty("user.home") + drillTestData;
    }
    connectionPool = Utils.getConnectionPool();
  }

  public static void main(String[] args) throws Exception {
    JCommander jc = null;
    try {
      jc = new JCommander(OPTIONS, args);
      jc.setProgramName("TestDriver");
    } catch (ParameterException e) {
      System.out.println(e.getMessage());
      String[] valid = {
    		  "-s", "Tests to run. A comma-separated list of testcase definition files and directories",
    		  "-g", "Test categories. A comma-separated list such as 'smoke,regression'", 
    		  "-t", "timeout in seconds for each test", 
    		  "-n", "number of concurrent threads running tests",
    		  "-i", "number of iterations of running the test", 
    		  "-f", "filename containing a list of queries to be executed before test run",
    		  "-e", "filename containing a list of queries to be executed after test run",
    		  "-d", "generate data", 
    		  "-m", "track memory usage",
    		  "-c", "percent of tests attempted to be canceled", 
    		  "-w", "enable write actual query result to file",
    		  "-h", "--help", "show usage"};
      new JCommander(OPTIONS, valid).usage();

      System.exit(-1);
    }
    if (OPTIONS.help) {
      jc.usage();
      System.exit(0);
    }

    final Stopwatch stopwatch = Stopwatch.createStarted();
    final TestDriver driver = new TestDriver();
    int errorCode;
    try {
      LOG.info(LINE_BREAK); LOG.info(LINE_BREAK);
      LOG.info("STARTING AT " + new Date());
      LOG.info(LINE_BREAK);
      errorCode = driver.runTests();
    } catch (Exception e) {
      LOG.error("Exiting due to uncaught exception", e);
      errorCode = -1;
    } finally {
      LOG.info(LINE_BREAK);
      LOG.info("FINISHED AT " + new Date());
      LOG.info("TOTAL DURATION: " + stopwatch);
      LOG.info(LINE_BREAK); LOG.info(LINE_BREAK);
    }
    System.exit(errorCode);
  }

  static class Options {
    @Parameter(names = {"-s"}, description = "sources", required=true)
    public String sources = null;

    @Parameter(names = {"-g"}, description = "groups", required=true)
    public String groups = null;

    @Parameter(names = {"-t"}, description = "timeout", required=false)
    public int timeout = 120;

    @Parameter(names = {"-n"}, description = "number of threads", required=false)
    public int threads = 1;

    @Parameter(names = {"-i"}, description = "number of iterations", required=false)
    public int iterations = 1;
    
    @Parameter(names = {"-f"}, description = "filename", required=false)
    public String beforeRunQueryFilename = "before-run.sql";
    
    @Parameter(names = {"-e"}, description = "filename", required=false)
    public String afterRunQueryFilename = "after-run.sql";
    
    @Parameter(names = {"-d"}, description = "generate data", required=false)
    public boolean generate = false;
    
    @Parameter(names = {"-m"}, description = "track memory usage", required=false)
    public boolean trackMemory = false;
    
    @Parameter(names = {"-c"}, description = "percent of tests canceled", required=false)
    public int cancelPercent = 0;
    
    @Parameter(names = {"-w"}, description = "enable write actual query result to file", required=false)
    public boolean outputQueryResult = false;

    @Parameter(names = {"-h", "--help"}, description = "show usage", help=true)
    public boolean help = false;

    @Parameter(names = {"-x", "--exclude"}, description = "Dependencies to exclude", required=false)
    public String excludeDependencies = null;

    public List<String> excludeDependenciesAsList() {
      if (excludeDependencies == null) {
        return new ArrayList<String>();
      }
      return Arrays.asList(TestDriver.OPTIONS.excludeDependencies.split(","));
    }
  }

  public int runTests() throws Exception {
	CancelingExecutor executor = new CancelingExecutor(OPTIONS.threads, OPTIONS.timeout);

    final Stopwatch stopwatch = Stopwatch.createStarted();
    LOG.info("> Pre-check..");
    //Check number of drillbits equals number of cluster nodes
    try {
		connection = connectionPool.getOrCreateConnection(drillProperties.get("USERNAME"), 
				drillProperties.get("PASSWORD"));
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		System.exit(-1);
	}
    int numberOfDrillbits = Utils.getNumberOfDrillbits(connection);
    connectionPool.releaseConnection(drillProperties.get("USERNAME"), 
    		drillProperties.get("PASSWORD"), connection);
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
    List<Cancelable> tests = Lists.newArrayList();
    for (DrillTestCase testCase : drillTestCases) {
      tests.add(getDrillTest(testCase, connectionPool));
    }


    
    int totalExecutionFailure = 0;
    int totalVerificationFailure = 0;
    int totalTimeoutFailure = 0;
    LOG.info("> TOOK " + stopwatch + " TO SETUP.");

    if (OPTIONS.trackMemory) {
  	  queryMemoryUsage();
    }

    for (int i = 1; i < OPTIONS.iterations+1; i++) {
      stopwatch.reset().start();
      LOG.info("> PREPARING DATA..");
      if (OPTIONS.generate) {
        prepareData(drillTestCases);
      }
      LOG.info("> TOOK " + stopwatch + " TO PREPARE DATA.");
      stopwatch.reset().start();

      LOG.info("> RUNNING TESTS (ITERATION " + i + ")..");
      Collections.shuffle(tests, new Random(12345));
      executor.executeAll(tests);

      if (OPTIONS.trackMemory) {
    	  queryMemoryUsage();
      }

      List<DrillTestJdbc> passingTests = Lists.newArrayList();
      List<DrillTestJdbc> verificationFailures = Lists.newArrayList();
      List<DrillTestJdbc> executionFailures = Lists.newArrayList();
      List<DrillTestJdbc> timeoutFailures = Lists.newArrayList();
      List<DrillTestJdbc> canceledTests = Lists.newArrayList();

      for (Cancelable test : tests) {
        DrillTestJdbc drilTest = (DrillTestJdbc) test;
        TestStatus testStatus = ((DrillTestJdbc) test).getTestStatus();
        switch (testStatus) {
        case PASS:
          passingTests.add(drilTest);
          break;
        case VERIFICATION_FAILURE:
          verificationFailures.add(drilTest);
          break;
        case EXECUTION_FAILURE:
          executionFailures.add(drilTest);
          break;
        case TIMEOUT:
          timeoutFailures.add(drilTest);
          break;
        case CANCELED:
          canceledTests.add(drilTest);
          break;
        default:
          executionFailures.add(drilTest);
        }
      }
      LOG.info(LINE_BREAK);LOG.info(LINE_BREAK);
      LOG.info("Tests completed for iteration " + i + " in " + stopwatch);
      LOG.info(LINE_BREAK);
      LOG.info(LINE_BREAK);
      LOG.info("Results:");
      LOG.info(LINE_BREAK);
      LOG.info("Execution Failures:");
      for (DrillTestJdbc test : executionFailures) {
        LOG.info(test.getInputFile());
        LOG.info("Query: \n" + test.getQuery());
        LOG.info("Failed with exception", test.getException());
      }
      LOG.info("Verification Failures:");
      for (DrillTestJdbc test : verificationFailures) {
        LOG.info(test.getInputFile());
        LOG.info("Query: \n" + test.getQuery());
        LOG.info(test.getException().getMessage());
      }
      LOG.info("Timeout Failures:");
      for (DrillTestJdbc test : timeoutFailures) {
        LOG.info(test.getInputFile());
        LOG.info("Query: \n" + test.getQuery());
      }
      LOG.info(LINE_BREAK);
      LOG.info("Summary");
      LOG.info(LINE_BREAK);
      LOG.info("Execution Failures:");
      for (DrillTestJdbc test : executionFailures) {
        LOG.info(test.getInputFile());
      }
      LOG.info("Verification Failures:");
      for (DrillTestJdbc test : verificationFailures) {
        LOG.info(test.getInputFile());
      }
      LOG.info("Timeout Failures:");
      for (DrillTestJdbc test : timeoutFailures) {
        LOG.info(test.getInputFile());
      }
      LOG.info(LINE_BREAK);
      LOG.info(String.format("\nPassing tests: %d\nExecution Failures: %d\nVerificationFailures: %d" +
      	"\nTimeouts: %d\nCanceled: %d", passingTests.size(), executionFailures.size(), 
      	verificationFailures.size(), timeoutFailures.size(), canceledTests.size()));
      
      if (OPTIONS.trackMemory) {
    	LOG.info(LINE_BREAK);
    	LOG.info(String.format("\nMemory Consumption:\n\t\theap(M)\t\tdirect(M)\tjvm_direct(M)\n" +
    			"  before:\t%d\t\t%d\t\t%d\n  after:\t%d\t\t%d\t\t%d", memUsage[0][0], memUsage[0][1], memUsage[0][2],
    			memUsage[1][0], memUsage[1][1], memUsage[1][2]));
      }

      totalExecutionFailure += executionFailures.size();
      totalVerificationFailure += verificationFailures.size();
      totalTimeoutFailure += timeoutFailures.size();
    }

    LOG.info("\n> TEARING DOWN..");
    teardown();
    executor.close();
    connectionPool.close();

    return totalExecutionFailure + totalVerificationFailure + totalTimeoutFailure;
  }

  public void setup() throws IOException, InterruptedException {
    if (!new File(drillOutputDirName).exists()) {
      new File(drillOutputDirName).mkdir();
    }

    String templatePath = CWD + "/src/main/resources/plugin-templates/";
    File[] templateFiles = new File(templatePath).listFiles();
    for (File templateFile : templateFiles) {
      String filename = templateFile.getName();
      String pluginType = filename.substring(0, filename.indexOf('-'));
      Utils.updateDrillStoragePlugin(templateFile.getAbsolutePath(),
          ipAddressPlugin, pluginType, fsMode);
      Thread.sleep(200);
    }
    try {
      String[] setupQueries = Utils.getSqlStatements(OPTIONS.beforeRunQueryFilename);
	  connection = connectionPool.getOrCreateConnection(drillProperties.get("USERNAME"), 
  				drillProperties.get("PASSWORD"));
      for (String query : setupQueries) {
        LOG.info(Utils.getSqlResult(Utils.execSQL(query, connection)));
      }
      connectionPool.releaseConnection(drillProperties.get("USERNAME"), 
    		  drillProperties.get("PASSWORD"), connection);
    } catch (IOException e) {
      LOG.warn("WARNING: " + OPTIONS.beforeRunQueryFilename + " file does not exist.\n");
    } catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		try {
			connection.close();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
    Thread.sleep(1000);
  }
  
  private void teardown() {

	try {
	  connection = connectionPool.getOrCreateConnection(drillProperties.get("USERNAME"),
				drillProperties.get("PASSWORD"));
	  String[] teardownQueries = Utils.getSqlStatements(OPTIONS.afterRunQueryFilename);
      for (String query : teardownQueries) {
        LOG.info(Utils.getSqlResult(Utils.execSQL(query, connection)));
      }
    } catch (IOException e) {
      LOG.warn("WARNING: " + OPTIONS.afterRunQueryFilename + " file does not exist.\n");
    } catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		try {
			connection.close();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	} 
	connectionPool.releaseConnection(drillProperties.get("USERNAME"), 
			drillProperties.get("PASSWORD"), connection);
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

    CancelingExecutor copyExecutor = new CancelingExecutor(OPTIONS.threads, Integer.MAX_VALUE);
    CancelingExecutor genExecutor = new CancelingExecutor(OPTIONS.threads, Integer.MAX_VALUE);
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
              Path src = new Path(CWD + "/resources", datasource.src);
              Path dest = new Path(drillTestData, datasource.dest);
              hdfsCopy(src, dest, false, fsMode);
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
      int exitCode = 0;
      String command = null;
      try {
        command = "/bin/bash " + restartDrillScript;
        LOG.info("Running command: " + command);
        exitCode = Runtime.getRuntime().exec(command).waitFor();
      } catch (Exception e) {
        LOG.error("Error: Failed to execute the command " + command + ".");
      }
      if (exitCode != 0) {
        throw new RuntimeException("Error executing the command " + command
            + " has return code " + exitCode);
      }
    }
  }
  

  private static void hdfsCopy(Path src, Path dest, boolean overWrite, String fsMode)
      throws IOException {
    LOG.debug("Copy " + src + " to " + dest);
    FileSystem fs;
    if (fsMode.equals(LOCALFS)) {
      fs = FileSystem.getLocal(conf);
    } else {
      fs = FileSystem.get(conf);
    }
    FileSystem localFs = FileSystem.getLocal(conf);
    if (localFs.getFileStatus(src).isDir()) {
      for (FileStatus file : localFs.listStatus(src)) {
        Path newSrc = file.getPath();
        Path newDest = new Path(dest, newSrc.getName());
        hdfsCopy(file.getPath(), newDest, overWrite, fsMode);
      }
    } else if (!fs.exists(dest) || overWrite) {
      fs.copyFromLocalFile(false, overWrite, src, dest);
    } else {
      LOG.debug("The source file " + src
          + " already exists in destination.  Skipping the copy.");
    }
  }

  public static void runGenerateScript(DataSource datasource) {
	String command = CWD + "/resources/" + datasource.src;
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
  
  private static DrillTest getDrillTest(DrillTestCase modeler, ConnectionPool connectionPool) {
    switch(modeler.queryType) {
    case "sql":
      return new DrillTestJdbc(modeler, connectionPool);
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
      connection = connectionPool.getOrCreateConnection(drillProperties.get("USERNAME"), 
    		drillProperties.get("PASSWORD"));
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
      connectionPool.releaseConnection(drillProperties.get("USERNAME"), 
    		  drillProperties.get("PASSWORD"), connection);
    } catch (IllegalArgumentException | IllegalAccessException e1) {
	  e1.printStackTrace();
    } catch (IOException e1) {
	  e1.printStackTrace();
    } catch (SQLException e1) {
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
}
