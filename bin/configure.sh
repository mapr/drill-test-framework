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
DRILL_CP="${mainDir}/jars/*"
JDBC_DRIVER_CP="${DRILL_HOME}/jars/jdbc-driver/drill-jdbc-all-${DRILL_VERSION}.jar"

maven_setup() {
  echo "Download and install maven"
  local mvn_url="https://archive.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz"
  curl "${mvn_url}" | tar -C "${mainDir}" -xz
}

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

    if [ -f /opt/mapr/conf/store-passwords.txt ]; then
        sslKey=$(grep ssl.client.truststore.password /opt/mapr/conf/store-passwords.txt | tr '=' '\n'| tail -1)
    else
      # TODO: Read keystore password from /opt/mapr/conf/ssl-client.xml
        echo "WARN: ssl keystore password wasn't set to config, please add it from /opt/mapr/conf/ssl-client.xml"
    fi

cat << EOF > ./conf/drillTestConfig.properties
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
TRUSTSTORE_PASSWORD=${sslKey}
AUTH_MECHANISM=${authMethod}

USERNAME=mapr
PASSWORD=mapr

export PATH=${M2_HOME}/bin:${PATH}
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

update_symlinks() {
    ln -sf ${DRILL_HOME}/jars/drill-hive-exec-shaded-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/drill-auth-mechanism-maprsasl-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/drill-common-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/drill-java-exec-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/drill-jdbc-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/drill-memory-base-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/drill-protocol-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/drill-rpc-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/drill-shaded-guava-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/vector-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/ext/zookeeper-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/classb/reflections-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/classb/javax.servlet-api-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/3rdparty/avatica-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/3rdparty/commons-codec-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/3rdparty/commons-collections-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/3rdparty/commons-configuration-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/3rdparty/config-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/3rdparty/curator-client-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/3rdparty/curator-framework-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/3rdparty/curator-recipes-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/3rdparty/curator-x-discovery-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/3rdparty/guava-shaded-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/3rdparty/hadoop-auth-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/3rdparty/hadoop-common-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/3rdparty/hadoop-yarn-common-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/3rdparty/hppc-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/3rdparty/jackson-annotations-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/3rdparty/jackson-core-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/3rdparty/jackson-databind-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/3rdparty/jetty-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/3rdparty/jcl-over-slf4j-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/3rdparty/maprfs-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/3rdparty/metrics-core-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/3rdparty/metrics-jmx-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/3rdparty/metrics-jvm-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/3rdparty/netty-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/3rdparty/protobuf-java-* ${mainDir}/jars/.
    ln -sf ${DRILL_HOME}/jars/3rdparty/xml-apis-*.jar ${mainDir}/jars/.
}

if [ ! -d ./apache-maven-3.6.3 ]; then
  maven_setup
  M2_HOME=$(pwd)/apache-maven-3.6.3
fi

echo "Creating link on drill-distrib.conf and drill-override.conf"
ln -sf ${DRILL_HOME}/conf/drill-distrib.conf ./conf/drill-distrib.conf
ln -sf ${DRILL_HOME}/conf/drill-override.conf ./conf/drill-override.conf

echo "Creating jars directory if not exist"
if [ ! -d ${mainDir}/jars ]; then
    mkdir ${mainDir}/jars
fi

echo "Creating/Updating symlinks for necessary drill's jars"
update_symlinks

if [ ! -f ./conf/drillTestConfig.properties ]; then
    gen_config
fi