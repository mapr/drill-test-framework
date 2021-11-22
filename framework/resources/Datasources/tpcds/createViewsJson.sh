#!/bin/sh
source conf/drillTestConfig.properties

hadoop fs -test -d /drill/testdata/tpcds_sf1/json/views ;if [ `echo $?` -eq 1 ]; then hadoop fs -mkdir /drill/testdata/tpcds_sf1/json/views; fi

if [ "$AUTH_MECHANISM" == "MAPRSASL" ]
then
  ${DRILL_HOME}/bin/sqlline -u "jdbc:drill:schema=dfs.tpcds_sf1_json_views;drillbit=${DRILL_STORAGE_PLUGIN_SERVER};auth=maprsasl"  --run=${DRILL_TEST_DATA_DIR}/Datasources/tpcds/createViewsJson.sql
elif [ -z "$PASSWORD" ]
then
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -u "jdbc:drill:schema=dfs.tpcds_sf1_json_views;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" --run=${DRILL_TEST_DATA_DIR}/Datasources/tpcds/createViewsJson.sql
else
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.tpcds_sf1_json_views;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=${DRILL_TEST_DATA_DIR}/Datasources/tpcds/createViewsJson.sql
fi
