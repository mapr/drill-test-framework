#!/bin/sh
source conf/drillTestConfig.properties

${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.Join;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=${DRILL_TEST_DATA_DIR}/Datasources/join/crt_tbls_partition_by_l.ddl
${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.Join;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=${DRILL_TEST_DATA_DIR}/Datasources/join/crt_tbls_partition_by_r.ddl

# it seems that sqlline does not exit, if one of the queries failed.
if [ "$?" -eq 0 ]
then
        exit 0
else
        echo "ERROR: create table script failed. Rerun create_tables_parquet.ddl to debug failures."
        exit 1
fi
