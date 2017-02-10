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

### Special handling for Drill version in regex based baseline verification

The Drill version in a regex based baseline file can be substituted with "{DRILL_VERSION}". 
At runtime, it will be replaced with actual Drill version and verified against the running version.

### Special handling for order-by tests

The Test Framework is able to verify the order in which rows are returned for
some SQL statements that have an order-by clause.  If the columns in the order-by
clause are also projected (present) in the output, then the Test Framework may
be able to check the order of the rows that are returned.  Here are some
requirements for a query to be validated by the Test Framework:

1) All columns/fields in the order-by clause must appear in the projection list
2) Expressions cannot be used in the order-by clause.  Things like
   "order by column.field[2]".  The [2] indicates an expression which is the
   third element in the field array.
3) Referencing a field within a json string in a column is more complicated.
   Most cases are supported.  Some cases may not work.
4) If a query references more than one table, then use aliases for each column
   in the projection list, and reference these aliases in the order-by clause.
   Using aliases is a good practice in general when verifying an order-by clause.
5) The order-by clause cannot be followed by another SQL operation except for
   limit.  If the order-by clause is followed by an offset or collate, for
   example, it might not work.

Here are some queries that can be validated:

1) select id, gbyi from `complex.json` order by id limit 10;

+-----+-------+
| id  | gbyi  |
+-----+-------+
| 1   | 1     |
| 2   | 2     |
| 3   | 3     |
| 4   | 4     |
| 5   | 5     |
| 6   | 6     |
| 7   | 7     |
| 8   | 8     |
| 9   | 9     |
| 10  | 10    |
+-----+-------+

This query can be validated because the results are ordered by the "id" column,
and the "id" column is projected in the output.  The Test Framework can
examine the output and verify that the rows are in order.

2) select * from
     (select d.uid uid, flatten(d.events) evnts from `data.json` d order by d.uid) s
     order by s.evnts.event_time, s.evnts.campaign_id;

+-------+--------------------------------------------------------------------------------------------------+
|  uid  |                                              evnts                                               |
+-------+--------------------------------------------------------------------------------------------------+
| 1     | {"event_name":"e1_name","event_time":1000000,"type":"cmpgn1"}                                    |
| 1     | {"event_name":"e2_name","event_time":2000000,"type":"cmpgn4","evnt_id":"e2","campaign_id":"c1"}  |
| null  | {"event_name":"e2_name","event_time":2000000,"type":"cmpgn4","evnt_id":"e2","campaign_id":"c1"}  |
| 1     | {"event_name":"e3_name","event_time":3000000,"type":"cmpgn1","evnt_id":"e3","campaign_id":"c1"}  |
| null  | {"event_name":"e3_name","event_time":3000000,"type":"cmpgn1","evnt_id":"e3","campaign_id":"c1"}  |
| null  | {"event_name":"e4_name","event_time":4000000,"type":"cmpgn1","evnt_id":"e4","campaign_id":"c1"}  |
| 1     | {"event_name":"e5_name","event_time":5000000,"type":"cmpgn3","evnt_id":"e5","campaign_id":"c2"}  |
| null  | {"event_time":6000000,"type":"cmpgn9","evnt_id":"e6","campaign_id":"c1"}                         |
| 1     | {"event_name":"e6_name","event_time":6000000,"type":"cmpgn9","evnt_id":"e6"}                     |
| null  | {"event_name":"e7_name","event_time":7000000,"type":"cmpgn3","evnt_id":"e7","campaign_id":"c1"}  |
| null  | {"event_name":"e8_name","event_time":8000000,"type":"null","evnt_id":"e8","campaign_id":"c2"}    |
| 1     | {"event_name":"e8_name","event_time":8000000,"type":"cmpgn2","evnt_id":"e8","campaign_id":"c2"}  |
| null  | {"event_time":9000000,"type":"cmpgn4","evnt_id":"e9","campaign_id":"c2"}                         |
| 1     | {"event_name":"e9_name","event_time":9000000,"type":"cmpgn4","evnt_id":"e9"}                     |
| 1     | {"event_name":"e7_name","type":"cmpgn3","evnt_id":"e7","campaign_id":"c1"}                       |
| 1     | {"event_name":"e4_name","type":"cmpgn1","evnt_id":"e4","campaign_id":"c1"}                       |
| null  | {"event_name":"e1_name","type":"cmpgn9","campaign_id":"c1"}                                      |
| null  | {"event_name":"e5_name","type":"cmpgn2","evnt_id":"e5","campaign_id":"c2"}                       |
+-------+--------------------------------------------------------------------------------------------------+

This query can be validated because the results are ordered by the data in the
"evnts" column, and the "evnts" column is projected in the output.  The Test
Framework can parse the JSON string in the "evnts" column and examine the
event_time and campaign_id values.


These queries cannot be validated:

1) select t.gbyt, t.id, t.ooa[0].`in` zeroin, t.ooa[1].fl.f1 flf1, t.ooa[1].fl.f2 flf2, t.ooa[1].`in` onein, t.ooa[2].a.aa.aaa, t.ooa[2].b.bb.bbb, t.ooa[2].c.cc.ccc from `complex.json` t where t.ooa[2].b.bb.bbb is not null order by t.ooa[2].c.cc.ccc limit 10;

+-------+--------+---------+-------------+-----------+--------+------------+------------+------------+
| gbyt  |   id   | zeroin  |    flf1     |   flf2    | onein  |   EXPR$6   |   EXPR$7   |   EXPR$8   |
+-------+--------+---------+-------------+-----------+--------+------------+------------+------------+
| aaa   | 10     | null    | null        | null      | 10     | aaa 10     | bbb 10     | ccc 10     |
| ooos  | 1000   | null    | null        | null      | 1000   | aaa 1000   | bbb 1000   | ccc 1000   |
| nul   | 10002  | null    | null        | null      | 10002  | aaa 10002  | bbb 10002  | ccc 10002  |
| sba   | 10003  | 10003   | 10003.6789  | 154351.0  | 10003  | aaa 10003  | bbb 10003  | ccc 10003  |
| str   | 10008  | 10008   | null        | null      | 10008  | aaa 10008  | bbb 10008  | ccc 10008  |
| fl    | 10009  | 10009   | null        | null      | 10009  | aaa 10009  | bbb 10009  | ccc 10009  |
| saa   | 1001   | null    | 1001.6789   | 64331.0   | 1001   | aaa 1001   | bbb 1001   | ccc 1001   |
| soa   | 10023  | null    | null        | null      | 10023  | aaa 10023  | bbb 10023  | ccc 10023  |
| nul   | 10028  | null    | 10028.6789  | 154601.0  | 10028  | aaa 10028  | bbb 10028  | ccc 10028  |
| ooos  | 10029  | null    | 10029.6789  | 154611.0  | 10029  | aaa 10029  | bbb 10029  | ccc 10029  |
+-------+--------+---------+-------------+-----------+--------+------------+------------+------------+

This query cannot be validated because the order-by has an expression,
"t.ooa[2].c.cc.ccc".  The Test Framework cannot evaluate the array reference
"ooa[2]".

2) select id from `complex.json` order by gbyi limit 10;

+------+
|  id  |
+------+
| 106  |
| 121  |
| 91   |
| 46   |
| 61   |
| 31   |
| 1    |
| 76   |
| 16   |
| 136  |
+------+

This query cannot be validated because the "gbyi" column is not projected so
the Test Framework cannot determine what the order should be.


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
[Robert](https://github.com/rhou1)   
