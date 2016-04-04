#!/bin/sh
source conf/drillTestConfig.properties

$DRILL_HOME/bin/sqlline -n mapr -p mapr -u "jdbc:drill:drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" -f ${DRILL_TEST_DATA_DIR}/Datasources/impersonation/dfs/noaccessnestedviews.sql
