#!/usr/bin/env sh
hostname=$(hostname -f)

DRILL_HOME=/opt/mapr/drill/drill-$(cat /opt/mapr/drill/drillversion)
if [ $? -ne 0 ]; then
  print "The Drill not installed"
  exit 1
fi
DRILL_VERSION=$(grep 'git.build.version' ${DRILL_HOME}/git.properties | tr '=' '\n' | tail -1)
HADOOP_MAPR_VERSION=$(cat /opt/mapr/hadoop/hadoopversion)
DRILL_CP=${DRILL_HOME}/jars/*:${DRILL_HOME}/jars/ext/*:${DRILL_HOME}/jars/3rdparty/*:${DRILL_HOME}/jars/classb/*
JDBC_DRIVER_CP=${DRILL_HOME}/jars/jdbc-driver/drill-jdbc-all-${DRILL_VERSION}.jar

maven_setup() {
  echo "Download and install maven"
  curl -O https://archive.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
  tar -xzf apache-maven-3.6.3-bin.tar.gz

}

if [ ! -d ./apache-maven-3.6.3 ]; then
  maven_setup
fi

echo "Create drillTestConfig file..."

cat << EOF > ./conf/drillTestConfig.properties
M2_HOME=$(pwd)/apache-maven-3.6.3
HADOOP_INSTALL_LOC=/opt/mapr
HADOOP_HOME=${HADOOP_INSTALL_LOC$}/hadoop/hadoop-{HADOOP_MAPR_VERSION}
DRILL_HOME=${DRILL_HOME}

DRILL_TEST_DATA_DIR=framework/resources
DRILL_TESTDATA=/drill/testdata
TIME_OUT_SECONDS=1500
NUMBER_OF_CLUSTER_NODES=1

DRILL_CP=${DRILL_CP}
JDBC_DRIVER_CP=${JDBC_DRIVER_CP}
JDBC_DRIVER=org.apache.drill.jdbc.Driver
CONNECTION_STRING=jdbc:drill:drillbit\=${hostname}:31010
DRILL_STORAGE_PLUGIN_SERVER=${hostname}
DRILL_STORAGE_PLUGIN_SERVER_PORT=8047

IS_SECURE_CLUSTER=false
SSL_ENABLED=false
HTTPS_ENABLED=false
TRUSTSTORE_PATH=/opt/mapr/conf/ssl_truststore
TRUSTSTORE_PASSWORD=
AUTH_MECHANISM=PLAIN

USERNAME=mapr
PASSWORD=mapr

export PATH=$M2_HOME:$PATH
export HADOOP_HOME
export DRILL_HOME
export DRILL_VERSION=${DRILL_VERSION}
export HADOOP_MAPR_VERSION=${HADOOP_MAPR_VERSION}
export DRILL_STORAGE_PLUGIN_SERVER
# TODO: create auto-generation
export HADOOP_VERSION=${HADOOP_MAPR_VERSION}
export USERNAME
export PASSWORD
EOF

echo "Creating link on drill-distrib.conf and drill-override.conf"
ln -s ${DRILL_HOME}/conf/drill-distrib.conf ./conf/drill-distrib.conf
ln -s ${DRILL_HOME}/conf/drill-override.conf ./conf/drill-override.conf