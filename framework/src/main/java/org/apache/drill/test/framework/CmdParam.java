package org.apache.drill.test.framework;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.beust.jcommander.Parameter;

  public class CmdParam  {
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
    
    @Parameter(names = {"-j"}, description = "number of testcase clones", required=false)
    public int clones = 1;
    
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
    
    @Parameter(names = {"-r", "--report"}, description = "Generate json report", required=false)
    public boolean generateReports = false;

    public List<String> excludeDependenciesAsList() {
      if (excludeDependencies == null) {
        return new ArrayList<String>();
      }
      return Arrays.asList(excludeDependencies.split(","));
    }
  }