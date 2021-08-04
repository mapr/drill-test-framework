#!/usr/bin/env sh
hostname=$(hostname -f)

maven_setup() {
  echo "Download and install maven"
  curl -O https://archive.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
  tar -xzf apache-maven-3.6.3-bin.tar.gz

}

if [ ! -d ./apache-maven-3.6.3 ]; then
  maven_setup
fi

echo "Create drillTestConfig file..."
DRILL_HOME=/opt/mapr/drill/drill-$(cat /opt/mapr/drill/drillversion)
echo "
NUMBER_OF_CLUSTER_NODES=1
DRILL_TEST_DATA_DIR=framework/resources
HADOOP_INSTALL_LOC=/opt/mapr
DRILL_HOME=${DRILL_HOME}
DRILL_TESTDATA=/drill/testdata
JDBC_DRIVER=org.apache.drill.jdbc.Driver
JDBC_DRIVER_CP=${DRILL_HOME}/jars/jdbc-driver/*
CONNECTION_STRING=jdbc:drill:drillbit\=${hostname}:31010
DRILL_STORAGE_PLUGIN_SERVER=${hostname}
DRILL_STORAGE_PLUGIN_SERVER_PORT=8047
TIME_OUT_SECONDS=300
AUTH_MECHANISM=PLAIN
USERNAME=mapr
M2_HOME=$(pwd)/apache-maven-3.6.3
export PATH=$M2_HOME:$PATH
export DRILL_STORAGE_PLUGIN_SERVER
export DRILL_HOME
export DRILL_VERSION=$(grep 'git.build.version' ${DRILL_HOME}/git.properties | tr '=' '\n' | tail -1)
export HADOOP_VERSION=2.7.0-mapr-1808
export USERNAME
export PASSWORD" > ./conf/drillTestConfig.properties
