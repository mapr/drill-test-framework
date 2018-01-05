package org.apache.drill.test.framework;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.beust.jcommander.Parameter;

  public class CmdParam  {
    @Parameter(names = {"-b"}, description = "file extension for different baseline expected results", required=false)
    public String driverExt = null;
    public String SIMBA_ODBC = "sodbc";
    
    @Parameter(names = {"-c"}, description = "percent of tests canceled", required=false)
    public int cancelPercent = 0;
    
    @Parameter(names = {"-d"}, description = "generate data", required=false)
    public boolean generate = false;
    
    @Parameter(names = {"-e"}, description = "filename", required=false)
    public String afterRunQueryFilename = "after-run.sql";
    
    @Parameter(names = {"-f"}, description = "filename", required=false)
    public String beforeRunQueryFilename = "before-run.sql";
    
    @Parameter(names = {"-g"}, description = "groups", required=true)
    public String groups = null;

    @Parameter(names = {"-h", "--help"}, description = "show usage", help=true)
    public boolean help = false;

    @Parameter(names = {"-i"}, description = "number of iterations", required=false)
    public int iterations = 1;
    
    @Parameter(names = {"-j"}, description = "number of testcase clones", required=false)
    public int clones = 1;
    
    @Parameter(names = {"-m"}, description = "track memory usage", required=false)
    public boolean trackMemory = false;
    
    @Parameter(names = {"-n"}, description = "number of threads", required=false)
    public int threads = 1;

    @Parameter(names = {"-r", "--report"}, description = "Generate json report", required=false)
    public boolean generateReports = false;

    @Parameter(names = {"-rf", "--runFailed"}, description = "Run tests tagged as failures", required=false)
    public boolean runFailed  = false;

    @Parameter(names = {"-rR", "--repeatRun"}, description = "Log the sequence of tests and run that sequence again", required=false)
    public boolean repeatRun  = false;

    @Parameter(names = {"-s"}, description = "sources", required=true)
    public String sources = null;

    @Parameter(names = {"-sR", "--skipRandom"}, description = "Skip check for random failures", required=false)
    public boolean skipRandom  = false;

    @Parameter(names = {"-t"}, description = "timeout", required=false)
    public int timeout = 120;

    @Parameter(names = {"-w"}, description = "enable write actual query result to file", required=false)
    public boolean outputQueryResult = false;

    @Parameter(names = {"-x", "--exclude"}, description = "Dependencies to exclude", required=false)
    public String excludeDependencies = null;
    
    public List<String> excludeDependenciesAsList() {
      if (excludeDependencies == null) {
        return new ArrayList<String>();
      }
      return Arrays.asList(excludeDependencies.split(","));
    }
  }
