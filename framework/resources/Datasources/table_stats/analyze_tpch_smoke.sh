#!/bin/sh
source conf/drillTestConfig.properties
set -xe
if [ -z "$PASSWORD" ]
then
 ${DRILL_HOME}/bin/sqlline -n ${USERNAME}  -u "jdbc:drill:schema=dfs.drillTestDir;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=${DRILL_TEST_DATA_DIR}/Datasources/table_stats/analyze_tpch_smoke.sql
else
 ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.drillTestDir;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=${DRILL_TEST_DATA_DIR}/Datasources/table_stats/analyze_tpch_smoke.sql
fi