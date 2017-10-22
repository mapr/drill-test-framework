#!/bin/sh
source conf/drillTestConfig.properties

hadoop fs -mkdir /drill/testdata/ctas_auto_partition
hadoop fs -rmr /drill/testdata/ctas_auto_partition/tpch_single_partition
hadoop fs -mkdir /drill/testdata/ctas_auto_partition/tpch_single_partition

if [ -z "$PASSWORD" ]
then
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -u "jdbc:drill:schema=dfs.ctasAutoPartition;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" --run=${DRILL_TEST_DATA_DIR}/Datasources/ctas_auto_partition/create_tables.ddl
else
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.ctasAutoPartition;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=${DRILL_TEST_DATA_DIR}/Datasources/ctas_auto_partition/create_tables.ddl
fi

# it seems that sqlline does not exit, if one of the queries failed.
if [ "$?" -eq 0 ]
then
        exit 0
else
        echo "ERROR: create table script failed. Rerun create_tables_parquet.ddl to debug failures."
        exit 1
fi
