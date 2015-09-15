#!/bin/sh

hadoop fs -test -d /drill/testdata/tpcds_sf1/parquet/views ;if [ `echo $?` -eq 1 ]; then hadoop fs -mkdir /drill/testdata/tpcds_sf1/parquet/views; fi

${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.tpcds_sf1_parquet_views;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=resources/Datasources/tpcds/createViewsParquet.sql
