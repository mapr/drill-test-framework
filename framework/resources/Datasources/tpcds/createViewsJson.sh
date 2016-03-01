#!/bin/sh
source conf/drillTestConfig.properties

hadoop fs -test -d /drill/testdata/tpcds_sf1/json/views ;if [ `echo $?` -eq 1 ]; then hadoop fs -mkdir /drill/testdata/tpcds_sf1/json/views; fi

${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.tpcds_sf1_json_views;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=${DRILL_TEST_DATA_DIR}/Datasources/tpcds/createViewsJson.sql
