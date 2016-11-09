# Test Framework for Apache Drill

Test Framework for SQL on Hadoop technologies. Currently supports [Apache Drill](http://drill.apache.org/), a schema-free SQL query engine for Hadoop, NoSQL and cloud storage.

The framework is built for regression, integration & sanity testing. Includes test coverage (with baselines) for core Drill functionality, and supported features. And are used by the Apache Drill community for pre-commit regression and part of the release criteria.

## Overview
 1. Clone the repository
 2. Configure test environment
 3. Review tests
 4. Build test framework
 5. Execute tests

### Clone the repository
 <pre><code>
 git clone git@github.com:mapr/drill-test-framework.git
 </code></pre>
Refer to [Github documentation](https://help.github.com/articles/cloning-a-repository) on how to clone a repository. 

### Configure test environment
 1. The test framework requires a distributed file system such as HDFS or MapR-FS to be configured. Some of the tests can also be run against a local file system. By default, it's configured to run against MapR-FS. You can change the default behavior by modifying [conf/core-site.xml](conf/core-site.xml). Refer to [conf/core-site.xml.example](conf/core-site.xml.example) for settings.
 2. To run all tests, Hive and HBase needs to be installed and running. To exclude Hive and HBase tests, please refer to the example in the Execute Tests section.
 3. The test framework should be run on a Drill cluster node. Refer to [Drill documentation](http://drill.apache.org/docs/installing-drill-in-distributed-mode) for details on how to setup Drill. It can also be run on a client node with additional configuration required.
 4. Cluster information are set in the [conf/drillTestConfig.properties](conf/drillTestConfig.properties) file. This is the main configuration file for the framework. It needs to be modified with local cluster info before compile the framework and run tests. 

### Review tests:

#### Structure of Test Framework
 <pre><code>
   drill-test-framework
     |_ framework
        |_ resources
           |_ Functional   (default location for test suites) 
           |_ Advanced     (test suites requiring large datasets)
           |_ Datasources  (datasets and scripts)
     |_ bin
        |_ build_framework (script used to compile the framework)
        |_ run_tests       (script used to execute tests)
</code></pre>

#### Adding Tests
 1. In the [Functional](framework/resources/Functional) / [Advanced](framework/resources/Advanced) directory, create a directory for a new test suite (or `cd` to an existing test suite).
 2. In the test suite directory, add testcases, expected results, and test definition file(s). Optionally include test suite sub directories to organize tests. 
 3. Pairs of testcase (ex: `query1.sql`) and expected result files (ex: `query1.e_tsv`) are co-located and share the same name.
 4. You could generate expected result files using Postgres or any such database.
 5. In the [Datasources][framework/resources/Datasources] directory, create corresponding datasource directories and copy over any required scripts and datasets required by the tests.
 6. Refer to [README](framework/resources/Advanced/README.md) for downloading datasets required for the Advanced tests. 

#### Structure of test definiton files. 
A test definition file is a JSON file that defines one or a set of tests within a directory. The framework scans for files with .json extension in the specified location(s) and executes all test(s) defined. 

 <pre><code>
 {
   "testId": "...",                    // Unique identification string for test suite. Ex: window_function_tests
   "type": "group",                    // Group of tests
   "negative": false,                  // Tests are positive or negative (expected success or expected failures)
   "description": "...",               // Description for test suites
   "submit-type": "jdbc",              // Currently the support types: jdbc, odbc, script
   "script": "Functional/script_location/script.sh paras" // Specify the test script to execute
   "queryType": "sql",              
   "timeout": null,
   "categories": [
     "...",                            // Labels for categorizing test suites. Ex: smoke
     "..."
   ],
   "dependencies": [
     "...",                            // Additional dependencies in setup. Ex: hive, hbase, maprdb
     "..."  
   ],
   "matrices": [
     {
       "query-file": `".*.sql"`,       // File name pattern of query files (REGEX). The example will match any filename with ".sql" extension
       "schema": "dfs.tmp",            // Drill storage plugin.workspace, or just the storage plugin name in case of hive, hbase
       "output-format": "tsv",         // Delimiter to seperate columns in expected result files
       "expected-file": `".*.e_tsv"`,  // File name pattern of expected result files (REGEX)
       "username": "user",
       "password": "pass",
       "verification-type": [          // Supported type "in-memory", "regex"
         "in-memory",
         "..."
       ]
     }
   ],
   "datasources": [
     {
       "mode": "cp",                   // Use "cp" to copy datasets
       "src": "`<Source path on local file system>`",
       "dest": "`<Destination path on DFS>`"
     },
     {
       "mode": "gen",                  // Use "gen" to execute scripts
       "src": "`<Source path on local file system>`",
       "dest": ""
     },
     ...
   ]
 }
</code></pre>

### Build test framework
In the root directory of you repository, issue 

`bin/build_framework -Pdownload` 

to build the project and also download any dependent datasets configured in `pom.xml`. If you already downloaded the dependent datasets, you can simply issue

`bin/build_framework`

### Execute tests
In the root directory of your repository, execute the following command to run tests:

`bin/run_tests -s <suites> -g <groups> -t <Timeout> -x <Exclude> -n <Concurrency> -d`

Example:
 <pre><code>
 	bin/run_tests -s `Functional/aggregates,Functional/joins` -g `smoke,regression` -x `hbase` -t `180` -n `2` -d
    -s suites (required)
       Here `Functional/aggregates,Functional/joins` are directories inside `framework/resources/Functional`. All test suites
       and sub-suites within a directory are included
    -g groups (required)
       Here `smoke, regression` are categories of tests to execute
    -t timeout (optional)
       Here `180` seconds is the max time for a query to execute
    -d data generation (required on first run and upon pulling in new changes. Optional otherwise)
       Here it turns on data copy and data generation
    -n concurrency (optional)
       Here `2` queries can execute concurrently
    -x exclude dependencies (optional)
       Here any `hbase` test suites within the specified directory are excluded
    -h help (optional)
       Use this option to provide the usage of the command, which includes additional options
</code></pre>

## Authors

[Zhiyong](https://github.com/zhiyongliu)  
[Chun](https://github.com/cchang738)  
[Krystal](https://github.com/krystaln)  
[Ramana](https://github.com/inramana)  
[Abhishek](https://github.com/agirish)  
[Vicky](https://github.com/vmarkman)  
[Suresh](https://github.com/sollala)  
[Khurram](https://github.com/kfaraaz)  
[Rahul](https://github.com/rchallapalli)  
[Steven](https://github.com/StevenMPhillips)  
[Jacques](https://github.com/jacques-n)  
[Jason](https://github.com/jaltekruse)  
[Sudheesh](https://github.com/sudheeshkatkam)   
