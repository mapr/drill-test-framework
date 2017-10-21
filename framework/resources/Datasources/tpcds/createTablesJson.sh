#!/bin/sh
source conf/drillTestConfig.properties

hadoop fs -test -d /drill/testdata/tpcds_sf1/json ;if [ `echo $?` -eq 0 ]; then hadoop fs -rmr /drill/testdata/tpcds_sf1/json; hadoop fs -mkdir /drill/testdata/tpcds_sf1/json; else hadoop fs -mkdir /drill/testdata/tpcds_sf1/json; fi

if [ -z "$PASSWORD" ]
then
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -u "jdbc:drill:schema=dfs.tpcds_sf1_json;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" --run=${DRILL_TEST_DATA_DIR}/Datasources/tpcds/createTablesJson.sql
else
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.tpcds_sf1_json;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=${DRILL_TEST_DATA_DIR}/Datasources/tpcds/createTablesJson.sql
${DRILL_TEST_DATA_DIR}/Datasources/tpcds/createViewsJson.sh
fi
