#!/bin/bash
source conf/drillTestConfig.properties

set -x

hadoop fs -test -d /drill/testdata/subqueries/hive1_parquet_part
dirExists_hive1_parquet_part=$?
if [ $dirExists_hive1_parquet_part -eq 0 ]; then
   hadoop fs -rm -r /drill/testdata/subqueries/hive1_parquet_part
fi

if [ -z "$PASSWORD" ]
then
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -u "jdbc:drill:schema=dfs.subqueries;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" --run=${DRILL_TEST_DATA_DIR}/Datasources/subqueries/create_tables.sql
else
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.subqueries;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=${DRILL_TEST_DATA_DIR}/Datasources/subqueries/create_tables.sql
fi

if [ "$?" -eq 0 ]
then
        exit 0
else
        echo "ERROR: create tables script failed."
        exit 1
fi

set +x
