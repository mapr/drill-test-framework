#!/usr/bin/env bash
hostname=$(hostname -f)
mainDir="$(pwd)"

DRILL_HOME=/opt/mapr/drill/drill-$(cat /opt/mapr/drill/drillversion)
if [ $? -ne 0 ]; then
  print "The Drill not installed"
  exit 1
fi
DRILL_VERSION=$(grep 'git.build.version' ${DRILL_HOME}/git.properties | tr '=' '\n' | tail -1)
HADOOP_MAPR_VERSION=$(cat /opt/mapr/hadoop/hadoopversion)
DRILL_CP="${DRILL_HOME}/jars/*:${DRILL_HOME}/jars/ext/*:${DRILL_HOME}/jars/3rdparty/*:${DRILL_HOME}/jars/classb/*"
JDBC_DRIVER_CP="${DRILL_HOME}/jars/jdbc-driver/drill-jdbc-all-${DRILL_VERSION}.jar"

maven_setup() {
  echo "Download and install maven"
  local mvn_url="https://archive.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz"
  curl "${mvn_url}" | tar -C "${mainDir}" -xz
}

if [ ! -d ./apache-maven-3.6.3 ]; then
  maven_setup
fi

echo "Creating link on drill-distrib.conf and drill-override.conf"
ln -s ${DRILL_HOME}/conf/drill-distrib.conf ./conf/drill-distrib.conf
ln -s ${DRILL_HOME}/conf/drill-override.conf ./conf/drill-override.conf

gen_config() {
    echo "Create drillTestConfig file..."
    jdbcUrl="${hostname}:31010"
    authMethod=PLAIN
    sslEnabled=false

    grep "security.auth.mechanisms" ./conf/drill-distrib.conf |grep -q "MAPRSASL"
    if [ $? -eq 0 ]; then
        authMethod=MAPRSASL
        jdbcUrl="${hostname}:31010;auth=${authMethod}"
    fi

    grep "http.ssl_enabled" ./conf/drill-distrib.conf |grep -q "true"
    if [ $? -eq 0 ]; then
        sslEnabled=true
    fi

    # TODO: Read keystore password from /opt/mapr/conf/ssl-client.xml
    echo "WARN: ssl keystore password wasn't set to config, please add it from /opt/mapr/conf/ssl-client.xml"


cat << EOF > ./conf/drillTestConfig.properties
M2_HOME=$(pwd)/apache-maven-3.6.3
HADOOP_INSTALL_LOC=/opt/mapr
HADOOP_HOME=${HADOOP_INSTALL_LOC}/hadoop/hadoop-${HADOOP_MAPR_VERSION}
DRILL_HOME=${DRILL_HOME}

DRILL_TEST_DATA_DIR=framework/resources
DRILL_TESTDATA=/drill/testdata
TIME_OUT_SECONDS=1500
NUMBER_OF_CLUSTER_NODES=1

DRILL_CP=${DRILL_CP}
JDBC_DRIVER_CP=${JDBC_DRIVER_CP}
JDBC_DRIVER=org.apache.drill.jdbc.Driver
CONNECTION_STRING=jdbc:drill:drillbit\=${jdbcUrl}
DRILL_STORAGE_PLUGIN_SERVER=${hostname}
DRILL_STORAGE_PLUGIN_SERVER_PORT=8047

IS_SECURE_CLUSTER=${sslEnabled}
SSL_ENABLED=${sslEnabled}
HTTPS_ENABLED=${sslEnabled}
TRUSTSTORE_PATH=/opt/mapr/conf/ssl_truststore
TRUSTSTORE_PASSWORD=
AUTH_MECHANISM=${authMethod}

USERNAME=mapr
PASSWORD=mapr

export PATH=${M2_HOME}:${PATH}
export HADOOP_HOME
export DRILL_HOME
export DRILL_VERSION=${DRILL_VERSION}
export HADOOP_MAPR_VERSION=${HADOOP_MAPR_VERSION}
export DRILL_STORAGE_PLUGIN_SERVER
export HADOOP_VERSION=${HADOOP_MAPR_VERSION}
export USERNAME
export PASSWORD
EOF

}

if [ ! -f ./conf/drillTestConfig.properties ]; then
    gen_config
fi