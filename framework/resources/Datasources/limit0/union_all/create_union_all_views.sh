#!/bin/sh
source conf/drillTestConfig.properties

set -x
set -e

${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.union_all;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=${DRILL_TEST_DATA_DIR}/Datasources/limit0/union_all/create_union_all_views.sql

set +x
