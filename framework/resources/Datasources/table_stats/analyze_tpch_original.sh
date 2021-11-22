#!/bin/bash
source conf/drillTestConfig.properties
set -xe

if [ "$AUTH_MECHANISM" == "MAPRSASL" ]
then
  ${DRILL_HOME}/bin/sqlline -u "jdbc:drill:schema=dfs.drillTestDir;drillbit=${DRILL_STORAGE_PLUGIN_SERVER};auth=maprsasl"  --run=${DRILL_TEST_DATA_DIR}/Datasources/table_stats/analyze_tpch_original.sql
elif [ -z "$PASSWORD" ]
then
 ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -u "jdbc:drill:schema=dfs.drillTestDir;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=${DRILL_TEST_DATA_DIR}/Datasources/table_stats/analyze_tpch_original.sql
else
 ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.drillTestDir;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=${DRILL_TEST_DATA_DIR}/Datasources/table_stats/analyze_tpch_original.sql
fi