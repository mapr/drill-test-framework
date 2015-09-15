#!/bin/sh

hadoop fs -test -d /drill/testdata/tpcds_sf1/json ;if [ `echo $?` -eq 0 ]; then hadoop fs -rmr /drill/testdata/tpcds_sf1/json; hadoop fs -mkdir /drill/testdata/tpcds_sf1/json; else hadoop fs -mkdir /drill/testdata/tpcds_sf1/json; fi

${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.tpcds_sf1_json;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=resources/Datasources/tpcds/createTablesJson.sql
resources/Datasources/tpcds/createViewsJson.sh
