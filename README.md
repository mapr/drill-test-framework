# Test Framework for Apache Drill

Test Framework for SQL on Hadoop technologies. Currently supports [Apache Drill](http://drill.apache.org/), a
schema-free SQL query engine for Hadoop, NoSQL and cloud storage.

The framework is built for regression, integration & sanity testing. Includes test coverage (with baselines) for
core Drill functionality, and supported features. The Apache Drill community uses the framework for for pre-commit
regression testing and as part of the release criteria.

## Requirements

 1. The test framework requires a distributed file system such as HDFS or MapR-FS to be configured.
    Some of the tests can also be run against a local file system. By default, it's configured to
    run against MapR-FS. You can change the default behavior by modifying
    [conf/core-site.xml](conf/core-site.xml). Refer to [conf/core-site.xml.example](conf/core-site.xml.example)
    for settings.
 2. To run all tests, Hive and HBase needs to be installed and running. To exclude Hive and HBase tests,
    please refer to the example in the Execute Tests section.
 3. The test framework should be run on a Drill cluster node. Refer to
    [Drill documentation](http://drill.apache.org/docs/installing-drill-in-distributed-mode) for details
    on how to setup Drill. It can also be run on a client node with additional configuration required.
 4. Cluster information are set in the [conf/drillTestConfig.properties](conf/drillTestConfig.properties)
    file. This is the main configuration file for the framework. It needs to be modified with local
    cluster info before compiling the framework and running tests.

## Build Project

To begin using the test framework, you need to build the project and download dependent
datasets (configured in [pom.xml](framework/pom.xml)).

```
git clone git@github.com:mapr/drill-test-framework.git
cd drill-test-framework/conf
cp drillTestConfig.properties.example drillTestConfig.properties
nano drillTestConfig.properties
bin/build_framework -Pdownload
```

## Configuring drillTestConfig.properties for run on singlenode cluster 
<pre><code>

</code></pre>

just uncomment property
<pre><code>
# Drillbits
########################################
DRILLBITS=localhost
########################################
</code></pre>

just uncomment property
<pre><code>
# Number of Drillbits
########################################
NUMBER_OF_CLUSTER_NODES=1
########################################
</code></pre>

set path to drill install dir
<pre><code>
# Drill home
########################################
DRILL_HOME=/opt/mapr/drill/drill-1.16.1
########################################
</code></pre>


just uncomment property
<pre><code>
# Drill test data dir
########################################
DRILL_TEST_DATA_DIR=framework/resources
########################################
# Drill actual resultset dir
########################################
DRILL_OUTPUT_DIR=drill-output
########################################
# Drill report dir
########################################
DRILL_REPORTS_DIR=drill-reports
DRILL_REPORTS_DFS_DIR=/drill/reports
########################################
</code></pre>

set location of hadoop system drill is installed
<pre><code>
########################################
HADOOP_INSTALL_LOC=/opt/mapr
########################################
</code></pre>

just uncoment propery
<pre><code>
########################################
DRILL_TESTDATA=/drill/testdata
########################################
</code></pre>


set zookeeper. For example - if you used singlenode cluster, with ip  192.168.121.91, set:
<pre><code>
########################################
ZOOKEEPERS=192.168.121.91:5181/drill/drillbits1
########################################
</code></pre>

just uncoment propery
<pre><code>
# DRILL JDBC driver
########################################
# MapR DRILL JDBC driver
JDBC_DRIVER=com.mapr.drill.jdbc41.Driver
# Apache DRILL JDBC driver
#JDBC_DRIVER=org.apache.drill.jdbc.Driver
########################################
# JDBC DRIVER CLASSPATH
########################################
#JDBC_DRIVER_CP=/root/DrillJDBC41/*
JDBC_DRIVER_CP=${DRILL_HOME}/jars/jdbc-driver/*
########################################
</code></pre>


set zookeeper. For example - if you used singlenode cluster, with ip  192.168.121.91, set:
<pre><code>
########################################
CONNECTION_STRING=jdbc:drill:zk\=192.168.121.91:5181/zk_root/cluster_id
########################################
</code></pre>

just uncoment propery
<pre><code>
# Drill storage plugin server
########################################
DRILL_STORAGE_PLUGIN_SERVER=192.168.121.91
########################################
</code></pre>

set example properyes
<pre><code>
USERNAME=mapr
PASSWORD=mapr
export ZOOKEEPER_HOST=192.168.121.91
export CLUSTER_NAME=Drill-ATS
export ZK_ROOT=drill-ats-build
export DRILL_USER=root
export CLUSH_GROUP=all
export DRILL_STORAGE_PLUGIN_SERVER
export DRILL_HOME=${DRILL_HOME}
export M2_HOME=/usr/share/maven
export M2=$M2_HOME/bin
export PATH=.:$M2:$PATH
export DRILL_VERSION=$(grep 'git.build.version' ${DRILL_HOME}/git.properties | tr '=' '\n' | tail -1)
export HADOOP_VERSION=2.7.4.0-mapr-700
export USERNAME
export PASSWORD
</code></pre>

If you've already downloaded the datasets previously, you can simply skip the download.

## Execute Tests

In the root directory of your repository, execute the following command to run tests:

`bin/run_tests -s <suites> -g <groups> -t <Timeout> -x <Exclude> -n <Concurrency> -d`

Example:
 <pre><code> bin/run_tests -s Functional/aggregates,Functional/joins -g functional -x hbase -t 180 -n 20 -d
  -s suites (required)
     Here, 'Functional/aggregates,Functional/joins' are directories inside
    [framework/resources/Functional](framework/resources/Functional). All directories
    within this parent directory are included
  -g groups (required)
     Here, 'functional' is category of tests to execute
  -t timeout (optional)
     Here, '180' seconds is the max time for a query to execute
  -d data generation (required on first run and upon pulling in new changes. Optional otherwise)
     Here, it turns on data copy and data generation
  -n concurrency (optional)
     Here, '20' queries can execute concurrently
  -x exclude dependencies (optional)
     Here, any 'hbase' test suites within the specified directory are excluded
  -h help (optional)
     Use this option to provide the usage of the command, which includes additional options
</code></pre>

## List of used tests

<pre><code>
bin/run_tests -s Functional/aggregates -g functional -t 180 -d
bin/run_tests -s Functional/amplab -g functional -t 180 -d
bin/run_tests -s Functional/case_expr -g functional -t 180 -d
bin/run_tests -s Functional/complex -g functional -t 180 -d
bin/run_tests -s Functional/convert -g functional -t 180 -d
bin/run_tests -s Functional/crossjoin -g functional -t 180 -d
bin/run_tests -s Functional/cross-sources -g functional -t 180 -d
bin/run_tests -s Functional/ctas -g functional -t 180 -d
bin/run_tests -s Functional/data-shapes -g functional -t 180 -d
bin/run_tests -s Functional/datetime -g functional -t 180 -d
bin/run_tests -s Functional/date_trunc -g functional -t 180 -d
bin/run_tests -s Functional/decimal -g functional -t 180 -d
bin/run_tests -s Functional/decimal_avro -g functional -t 180 -d
bin/run_tests -s Functional/decimal_negative -g functional -t 180 -d
bin/run_tests -s Functional/decimal_parquet -g functional -t 180 -d
bin/run_tests -s Functional/drill_fragments -g functional -t 180 -d
bin/run_tests -s Functional/droptable -g functional -t 180 -d
bin/run_tests -s Functional/explicit_cast -g functional -t 180 -d
bin/run_tests -s Functional/filter -g functional -t 180 -d
bin/run_tests -s Functional/flatten_operators -g functional -t 180 -d
bin/run_tests -s Functional/functions -g functional -t 180 -d
bin/run_tests -s Functional/group_by_alias, -g functional -t 180 -d
bin/run_tests -s Functional/hbase -g functional -t 180 -d
bin/run_tests -s Functional/hive -g functional -t 180 -d
bin/run_tests -s Functional/hive_functions_nonhivedata -g functional -t 180 -d
bin/run_tests -s Functional/identifiers -g functional -t 180 -d
bin/run_tests -s Functional/impersonation -g functional -t 180 -d
bin/run_tests -s Functional/implicit_cast -g functional -t 180 -d
bin/run_tests -s Functional/int96 -g functional -t 180 -d
bin/run_tests -s Functional/interpreted_partition_pruning -g functional -t 180 -d
bin/run_tests -s Functional/joins -g functional -t 180 -d
bin/run_tests -s Functional/json -g functional -t 180 -d
bin/run_tests -s Functional/limit0 -g functional -t 180 -d
bin/run_tests -s Functional/metadata_caching -g functional -t 180 -d
bin/run_tests -s Functional/min_max_dir -g functional -t 180 -d
bin/run_tests -s Functional/misc -g functional -t 180 -d
bin/run_tests -s Functional/morefiles -g functional -t 180 -d
bin/run_tests -s Functional/no_result_set -g functional -t 180 -d
bin/run_tests -s Functional/orderby -g functional -t 180 -d
bin/run_tests -s Functional/p1tests -g functional -t 180 -d
bin/run_tests -s Functional/parquet_storage -g functional -t 180 -d
bin/run_tests -s Functional/partition_pruning -g functional -t 180 -d
bin/run_tests -s Functional/query_parser -g functional -t 180 -d
bin/run_tests -s Functional/s3minio -g functional -t 180 -d
bin/run_tests -s Functional/schema_change_empty_batch -g functional -t 180 -d
bin/run_tests -s Functional/schema-changes -g functional -t 180 -d
bin/run_tests -s Functional/semijoin -g functional -t 180 -d
bin/run_tests -s Functional/subqueries -g functional -t 180 -d
bin/run_tests -s Functional/table_function -g functional -t 180 -d
bin/run_tests -s Functional/table_stats -g functional -t 180 -d
bin/run_tests -s Functional/text_storage -g functional -t 180 -d
bin/run_tests -s Functional/timestamp_functions -g functional -t 180 -d
bin/run_tests -s Functional/tpcds -g functional -t 180 -d
bin/run_tests -s Functional/tpch -g functional -t 180 -d
bin/run_tests -s Functional/udfs -g functional -t 180 -d
bin/run_tests -s Functional/union -g functional -t 180 -d
bin/run_tests -s Functional/union_all -g functional -t 180 -d
bin/run_tests -s Functional/values -g functional -t 180 -d
bin/run_tests -s Functional/views -g functional -t 180 -d
bin/run_tests -s Functional/window_functions -g functional -t 180 -d
</code></pre>
## Contributing

We encourage contributions from users! You can fix bugs, make enhancements or add new tests. Create a PR here on GitHub for your change.

Refer to [CONTRIBUTING.md](CONTRIBUTING.md) for details on the test framework structure and instructions on how to contribute.

## License

Licensed under the Apache License 2.0. Please see [LICENSE.md](LICENSE.md)



