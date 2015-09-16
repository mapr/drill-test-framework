# Test Framework for Apache Drill

Test Framework for SQL on Hadoop technologies. Currently supports [Apache Drill](http://drill.apache.org/), a schema-free SQL query engine for Hadoop, NoSQL and cloud storage.

The framework is built for regression, integration & sanity testing. Includes test coverage (with baselines) for core Drill functionality, and supported features. A subset of these tests are used by the Apache Drill community for pre-commit and pre-release criteria.

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
 1. The test framework expects Drill services to be setup on a clustered environment. Refer to [Drill documentation](http://drill.apache.org/docs/installing-drill-in-distributed-mode) for details on how to setup Drill.
 2. Copy the `drillTestConfig` file from `framework/src/main/resources` to your home directory as `~/.drillTestConfig`. Edit suitably, following instructions in the file.
 3. Source `.drillTestConfig`. Confirm `DRILL_HOME` and other required environment variables are set. 

### Review tests:

#### Structure of Test Framework
 <pre><code>
   drill-test-framework
     |_ framework
        |_ resources
           |_ Functional   (default location for test suites) 
           |_ Advanced     (test suites requiring large datasets reside here)
           |_ Datasources  (datasets and scripts)
           |_ External     (external test repos can be cloned in here)
</code></pre>

#### Adding Tests
 1. `cd framework/resources`
 2. `cd Functional or Advanced`
 3. Create a new directory for the test suite (or `cd` to an existing test suite, related to the new tests being added)
 4. In the test suite directory, add testcases, expected results, and test definition file(s). Optionally include test suite sub directories to organize tests. 
 5. Pairs of testcase (ex: `query1.sql`) and expected results (ex: `query1.e_tsv`) are co-located and share the same name. 
 6. You could generate expected result files using Postgres or any such database.
 7. `cd Datasources`
 8. Create corresponding datasources directory and copy over any required data generation scripts and/or datasets

#### Structure of test definiton files

 <pre><code>
 {
   "testId": "...",                    // Unique identification string for test suite. Ex: window_function_tests
   "type": "group",                    // Group of tests
   "negative": false,                  // Tests are positive or negative (expected success or expected failures)
   "description": "...",               // Description for test suites
   "submit-type": "jdbc",              // Currently only support jdbc
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
In the framework directory, execute `mvn clean install` first, to build the project and also download any dependent datasets configured in `pom.xml`

### Execute tests
Execute the following command, to run tests:
`./run.sh -s <suites> -g <groups> -t <Timeout> -n <Concurrency>`

Example:
 <pre><code>
 	`./run.sh -s Functional/aggregates,Functional/joins -g smoke,regression -t 180 -n 2`
 	`./run.sh -h`
 	Usage: TestDriver [options]
  Options:
    -x, --exclude
       Dependencies to exclude
    -h, --help
       show usage
       Default: false
    -c
       percent of tests canceled
       Default: 0
    -d
       generate data
       Default: false
    -g
       groups (categories of tests. Ex: smoke, regression) 
    -i
       number of iterations
       Default: 1
    -m
       track memory usage
       Default: false
    -n
       number of threads
       Default: 1
    -s
       sources (Test suite are directories inside `framework/resources/Functional` and `framework/resources/Advanced`
    -t
       timeout (in seconds)
       Default: 120
    -w
       enable write actual query result to file
       Default: false
</code></pre>
