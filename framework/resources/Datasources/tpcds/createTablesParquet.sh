#!/bin/sh

hadoop fs -test -d /drill/testdata/tpcds_sf1/parquet ;if [ `echo $?` -eq 0 ]; then hadoop fs -rmr /drill/testdata/tpcds_sf1/parquet; hadoop fs -mkdir /drill/testdata/tpcds_sf1/parquet; else hadoop fs -mkdir /drill/testdata/tpcds_sf1/parquet; fi

${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.tpcds_sf1_parquet;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=resources/Datasources/tpcds/createTablesParquet.sql
