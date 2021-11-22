#!/bin/bash
source conf/drillTestConfig.properties

set -x
set -e

if [ "$AUTH_MECHANISM" == "MAPRSASL" ]
then
  ${DRILL_HOME}/bin/sqlline -u "jdbc:drill:schema=dfs.union;drillbit=${DRILL_STORAGE_PLUGIN_SERVER};auth=maprsasl"  --run=${DRILL_TEST_DATA_DIR}/Datasources/limit0/union/create_union_views.sql
elif [ -z "$PASSWORD" ]
then
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -u "jdbc:drill:schema=dfs.union;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" --run=${DRILL_TEST_DATA_DIR}/Datasources/limit0/union/create_union_views.sql
else
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.union;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=${DRILL_TEST_DATA_DIR}/Datasources/limit0/union/create_union_views.sql
fi

set +x
