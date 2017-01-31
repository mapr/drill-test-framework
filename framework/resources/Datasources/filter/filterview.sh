#!/bin/sh
source conf/drillTestConfig.properties

$DRILL_HOME/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" -f ${DRILL_TEST_DATA_DIR}/Datasources/filter/filterview.sql

