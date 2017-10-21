#!/bin/sh
source conf/drillTestConfig.properties

hadoop fs -rm -r /drill/testdata/subqueries/optional_type_v.view.drill
hadoop fs -rm -r /drill/testdata/subqueries/required_type_v.view.drill

if [ -z "$PASSWORD" ]
then
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -u "jdbc:drill:schema=dfs.subqueries;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" --run=${DRILL_TEST_DATA_DIR}/Datasources/subqueries/create_views.sql
else
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.subqueries;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=${DRILL_TEST_DATA_DIR}/Datasources/subqueries/create_views.sql
fi

if [ "$?" -eq 0 ]
then
        exit 0
else
        echo "ERROR: create view script failed."
        exit 1
fi
