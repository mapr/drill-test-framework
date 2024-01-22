# Test Framework for Apache Drill

Test Framework for SQL on Hadoop technologies. Currently supports [Apache Drill](http://drill.apache.org/), a schema-free SQL query engine for Hadoop, NoSQL and cloud storage.

The framework is built for regression, integration & sanity testing. Includes test coverage (with baselines) for core Drill functionality, and supported features. And are used by the Apache Drill community for pre-commit regression and part of the release criteria.

## Requirements
 1. The test framework requires a distributed file system such as HDFS or MapR-FS to be configured. Some of the tests can also be run against a local file system. By default, it's configured to run against MapR-FS. You can change the default behavior by modifying [conf/core-site.xml](conf/core-site.xml). Refer to [conf/core-site.xml.example](conf/core-site.xml.example) for settings.
 2. To run all tests, Hive and HBase needs to be installed and running. To exclude Hive and HBase tests, please refer to the example in the Execute Tests section.
 3. The test framework should be run on a Drill cluster node. Refer to [Drill documentation](http://drill.apache.org/docs/installing-drill-in-distributed-mode) for details on how to setup Drill. It can also be run on a client node with additional configuration required.
 4. Cluster information are set in the [conf/drillTestConfig.properties](conf/drillTestConfig.properties) file. This is the main configuration file for the framework. It needs to be modified with local cluster info before compile the framework and run tests. 

## Build Project
Note: `drill-1.20.x-eep9-master-local-res` test branch is created specifically for `eep-9.x` line and contain a number of fixes and simplification to make build & run process easier and less faulty.

To begin using the test framework, you need to build the project and download dependent datasets (configured in [pom.xml](framework/pom.xml)). 

This is a branch created to use locally downloaded resources.

> Nodes with a copy of test resources in root home dir: 

| ip            |
|---------------|
| 10.163.165.33 |
| 10.163.165.53 |
| 10.163.165.15 |

All tests are passed with this type of configuration. 

See required preconditions:

```
git clone -b drill-1.20.x-eep9-master-local-res --depth 1 --single-branch https://github.com/mapr/drill-test-framework.git

scp -r root@<HOST>:/root/drill_test_data_do_not_remove/* /home/mapr/drill_res/

chown -R mapr:mapr /home/mapr/drill_res

cd /home/mapr/drill_res

cp * /home/mapr/drill-test-framework/framework/resources/Datasources/

cd /home/mapr/drill-test-framework/

./bin/configure.sh

./bin/drill.sh -b --download

bin/drill.sh --run
```

## Execute Tests
In the root directory of your repository, execute the following command to run tests:
Usage examples:
`.bin/drill.sh --run --test <group/suite>`</br>

Example:
<pre><code> ./drill.sh --run --test Functional/aggregates</code></pre>

[comment]: <> (OLD USAGE)
[comment]: <> (`bin/run_tests -s <suites> -g <groups> -t <Timeout> -x <Exclude> -n <Concurrency> -d`)
[comment]: <> (<pre><code> bin/run_tests -s Functional/aggregates,Functional/joins -g functional -x hbase -t 180 -n 20 -d)
[comment]: <> (  -s suites &#40;required&#41;)
[comment]: <> (     Here, 'Functional/aggregates,Functional/joins' are directories inside [framework/resources/Functional]&#40;framework/resources/Functional&#41;. All directories within this parent directory are included)
[comment]: <> (  -g groups &#40;required&#41;)
[comment]: <> (     Here, 'functional' is category of tests to execute)
[comment]: <> (  -t timeout &#40;optional&#41;)
[comment]: <> (     Here, '180' seconds is the max time for a query to execute)
[comment]: <> (  -d data generation &#40;required on first run and upon pulling in new changes. Optional otherwise&#41;)
[comment]: <> (     Here, it turns on data copy and data generation)
[comment]: <> (  -n concurrency &#40;optional&#41;)
[comment]: <> (     Here, '20' queries can execute concurrently)
[comment]: <> (  -x exclude dependencies &#40;optional&#41;)
[comment]: <> (     Here, any 'hbase' test suites within the specified directory are excluded)
[comment]: <> (  -h help &#40;optional&#41;)
[comment]: <> (     Use this option to provide the usage of the command, which includes additional options)
[comment]: <> (</code></pre>)

## Contributing

We encourage contributions from users! You can fix bugs, make enhancements or add new tests. Create a PR here on GitHub for your change.

Refer to [CONTRIBUTING.md](CONTRIBUTING.md) for details on the test framework structure and instructions on how to contribute.

## License
Licensed under the Apache License 2.0. Please see [LICENSE.md](LICENSE.md)