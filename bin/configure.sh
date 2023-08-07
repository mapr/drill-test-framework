#!/usr/bin/env bash
hostname=$(hostname -f)
mainDir="$(pwd)"
SETTINGS_XML_TEMPLATE="./conf/settings.xml.template"
SETTINGS_XML_LOCATION="$HOME/.m2/settings.xml"

DRILL_HOME=/opt/mapr/drill/drill-$(cat /opt/mapr/drill/drillversion)
if [ $? -ne 0 ]; then
  print "The Drill not installed"
  exit 1
fi
DRILL_VERSION=$(grep 'git.build.version' ${DRILL_HOME}/git.properties | tr '=' '\n' | tail -1)
HADOOP_MAPR_VERSION=$(cat /opt/mapr/hadoop/hadoopversion)
DRILL_CP="${DRILL_HOME}/jars/*:${DRILL_HOME}/jars/ext/*:${DRILL_HOME}/jars/3rdparty/*:${DRILL_HOME}/jars/classb/*"
JDBC_DRIVER_CP="${DRILL_HOME}/jars/jdbc-driver/drill-jdbc-all-${DRILL_VERSION}.jar"

echo "Configuring ~/.m2/settings.xml file to be able to download test resources"

# Create the ~/.m2 directory if it doesn't exist
if [ ! -d "$HOME/.m2" ]; then
  mkdir -p "$HOME/.m2"
fi

# Copy the source file to the target location, overwriting it if it already exists
cp -f "$SETTINGS_XML_TEMPLATE" "$SETTINGS_XML_LOCATION"

echo "The file $SETTINGS_XML_TEMPLATE has been successfully copied to $SETTINGS_XML_LOCATION."

maven_setup() {
  echo "Download and install maven"
  local mvn_url="https://archive.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz"
  curl "${mvn_url}" | tar -C "${mainDir}" -xz
}

if [ ! -d ./apache-maven-3.6.3 ]; then
  maven_setup
  M2_HOME=$(pwd)/apache-maven-3.6.3
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

    if [ -f /opt/mapr/conf/store-passwords.txt ]; then
        sslKey=$(grep ssl.client.truststore.password /opt/mapr/conf/store-passwords.txt | tr '=' '\n'| tail -1)
    else
      # TODO: Read keystore password from /opt/mapr/conf/ssl-client.xml
        echo "WARN: ssl keystore password wasn't set to config, please add it from /opt/mapr/conf/ssl-client.xml"
    fi

cat << EOF > ./conf/drillTestConfig.properties
HADOOP_HOME=/opt/mapr/hadoop/hadoop-${HADOOP_MAPR_VERSION}
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

update_components_build_version_in_pom_file(){
  mapr_home='/opt/mapr'
  hadoop_version=$(cat ${mapr_home}/hadoop/hadoopversion)

  drill_build_version=$(ls ${DRILL_HOME}/jars/ | grep "drill-jdbc-storage" | head -n 1 | sed 's/^drill-jdbc-storage-\(.*\).jar$/\1/')
  hadoop_build_version=$(ls ${mapr_home}/hadoop/hadoop-${hadoop_version}/share/hadoop/common | grep hadoop | head -n 1 | sed 's/.jar//;s/-tests//' | awk '{ split($0,a,/^([a-zA-Z]*-)*/); print a[2] }')
  mapr_core_build_version=$(ls ${mapr_home}/lib/ | grep maprfs | head -n 1 | sed 's/.jar//;s/-tests//' | awk '{ split($0,a,/^([a-zA-Z]*-)*/); print a[2] }')
  zookeeper_build_version=$(ls ${mapr_home}/lib/ | grep "zookeeper" | head -n 1 | sed 's/^zookeeper-\(.*\).jar$/\1/')

  echo Drill build version ${drill_build_version} will be set in pom.xml
  echo Hadoop version ${hadoop_build_version} will be set in pom.xml
  echo Mapr core build version ${mapr_core_build_version} will be set in pom.xml
  echo Zookeeper build version ${zookeeper_build_version} will be set in pom.xml

  sed -i "1,/<drill.version>.*<\/drill.version>/ s/<drill.version>.*<\/drill.version>/<drill.version>${drill_build_version}<\/drill.version>/1" framework/pom.xml
  sed -i "1,/<hadoop.version>.*<\/hadoop.version>/ s/<hadoop.version>.*<\/hadoop.version>/<hadoop.version>${hadoop_build_version}<\/hadoop.version>/1" framework/pom.xml
  sed -i "1,/<mapr.core.version>.*<\/mapr.core.version>/ s/<mapr.core.version>.*<\/mapr.core.version>/<mapr.core.version>${mapr_core_build_version}<\/mapr.core.version>/1" framework/pom.xml
  sed -i "1,/<zookeeper.version>.*<\/zookeeper.version>/ s/<zookeeper.version>.*<\/zookeeper.version>/<zookeeper.version>${zookeeper_build_version}<\/zookeeper.version>/1" framework/pom.xml
}

update_components_build_version_in_pom_file

if [ ! -f ./conf/drillTestConfig.properties ]; then
    gen_config
fi