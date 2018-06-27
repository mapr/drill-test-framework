# Test Framework for Apache Drill

Test Framework for SQL on Hadoop technologies. Currently supports [Apache Drill](http://drill.apache.org/), a schema-free SQL query engine for Hadoop, NoSQL and cloud storage.

The framework is built for regression, integration & sanity testing. Includes test coverage (with baselines) for core Drill functionality, and supported features. And are used by the Apache Drill community for pre-commit regression and part of the release criteria.

## Requirements
 1. The test framework requires a distributed file system such as HDFS or MapR-FS to be configured. Some of the tests can also be run against a local file system. By default, it's configured to run against MapR-FS. You can change the default behavior by modifying [conf/core-site.xml](conf/core-site.xml). Refer to [conf/core-site.xml.example](conf/core-site.xml.example) for settings.
 2. To run all tests, Hive and HBase needs to be installed and running. To exclude Hive and HBase tests, please refer to the example in the Execute Tests section.
 3. The test framework should be run on a Drill cluster node. Refer to [Drill documentation](http://drill.apache.org/docs/installing-drill-in-distributed-mode) for details on how to setup Drill. It can also be run on a client node with additional configuration required.
 4. Cluster information are set in the [conf/drillTestConfig.properties](conf/drillTestConfig.properties) file. This is the main configuration file for the framework. It needs to be modified with local cluster info before compile the framework and run tests. 

## Build Project
To begin using the test framework, you need to build the project and download dependent datasets (configured in [pom.xml](framework/pom.xml)). 
```
git clone git@github.com:mapr/drill-test-framework.git
cd drill-test-framework
bin/build_framework -Pdownload
``` 
If you've already downloaded the datasets previously, you can simply skip the download.

## Execute Tests
In the root directory of your repository, execute the following command to run tests:

`bin/run_tests -s <suites> -g <groups> -t <Timeout> -x <Exclude> -n <Concurrency> -d`

Example:
 <pre><code> bin/run_tests -s Functional/aggregates,Functional/joins -g functional -x hbase -t 180 -n 20 -d
  -s suites (required)
     Here, 'Functional/aggregates,Functional/joins' are directories inside [framework/resources/Functional](framework/resources/Functional). All directories within this parent directory are included
  -g groups (required)
     Here, 'functional' is category of tests to execute
  -t timeout (optional)
     Here, '180' seconds is the max time for a query to execute
  -d data generation (required on first run and upon pulling in new changes. Optional otherwise)
     Here, it turns on data copy and data generation
  -n concurrency (optional)
     Here, '2' queries can execute concurrently
  -x exclude dependencies (optional)
     Here, any 'hbase' test suites within the specified directory are excluded
  -h help (optional)
     Use this option to provide the usage of the command, which includes additional options
</code></pre>

## Contributing

We encourage contributions from users! You can fix bugs, make enhancements or add new tests. Create a PR here on GitHub for your change.

Refer to [CONTRIBUTING.md](CONTRIBUTING.md) for details on the test framework structure and instructions on how to contribute.

## License
Licensed under the Apache License 2.0. Please see [LICENSE.md](LICENSE.md)
