#!/bin/sh
source conf/drillTestConfig.properties

if [ "$AUTH_MECHANISM" == "MAPRSASL" ]
then
  ${DRILL_HOME}/bin/sqlline -u "jdbc:drill:drillbit=${DRILL_STORAGE_PLUGIN_SERVER};auth=maprsasl" -f ${DRILL_TEST_DATA_DIR}/Datasources/impersonation/dfs/noaccessnestedviews.sql
elif [ -z "$PASSWORD" ]
then
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u  "jdbc:drill:drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" -f ${DRILL_TEST_DATA_DIR}/Datasources/impersonation/dfs/noaccessnestedviews.sql
else
    ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -u  "jdbc:drill:drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" -f ${DRILL_TEST_DATA_DIR}/Datasources/impersonation/dfs/noaccessnestedviews.sql
fi