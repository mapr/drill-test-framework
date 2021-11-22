#!/bin/bash

source conf/drillTestConfig.properties

hadoop fs -test -d /drill/testdata/tpcds_sf1/maprdb/json/views ;if [ `echo $?` -eq 1 ]; then hadoop fs -mkdir /drill/testdata/tpcds_sf1/maprdb/json/views; fi

if [ "$AUTH_MECHANISM" == "MAPRSASL" ]
then
  ${DRILL_HOME}/bin/sqlline -u "jdbc:drill:schema=dfs.tpcds_sf1_maprdb_json_views;drillbit=${DRILL_STORAGE_PLUGIN_SERVER};auth=maprsasl"  --run=${DRILL_TEST_DATA_DIR}/Datasources/tpcds/maprdb/json/createViews.sql
elif [ -z "$PASSWORD" ]
then
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -u "jdbc:drill:schema=mfs.tpcds_sf1_maprdb_json_views;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" --run=${DRILL_TEST_DATA_DIR}/Datasources/tpcds/maprdb/json/createViews.sql
else
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=mfs.tpcds_sf1_maprdb_json_views;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=${DRILL_TEST_DATA_DIR}/Datasources/tpcds/maprdb/json/createViews.sql
fi
