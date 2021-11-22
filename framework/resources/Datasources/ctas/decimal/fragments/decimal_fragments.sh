#!/bin/bash
source conf/drillTestConfig.properties

tar -xzmvf ${DRILL_TEST_DATA_DIR}/Datasources/ctas/decimal/fragments/decimal_big.tar.gz -C ${DRILL_TEST_DATA_DIR}/Datasources/ctas/decimal/fragments
tar -xzmvf ${DRILL_TEST_DATA_DIR}/Datasources/ctas/decimal/fragments/decimal_big_zero_prec.tar.gz -C ${DRILL_TEST_DATA_DIR}/Datasources/ctas/decimal/fragments
tar -xzmvf ${DRILL_TEST_DATA_DIR}/Datasources/ctas/decimal/fragments/decimal_big_zero_scale.tar.gz -C ${DRILL_TEST_DATA_DIR}/Datasources/ctas/decimal/fragments

hadoop fs -mkdir -p /drill/testdata/decimal/fragments

hadoop fs -put ${DRILL_TEST_DATA_DIR}/Datasources/ctas/decimal/fragments/decimal_big.tsv /drill/testdata/decimal/fragments
hadoop fs -put ${DRILL_TEST_DATA_DIR}/Datasources/ctas/decimal/fragments/decimal_big_zero_prec.tsv /drill/testdata/decimal/fragments
hadoop fs -put ${DRILL_TEST_DATA_DIR}/Datasources/ctas/decimal/fragments/decimal_big_zero_scale.tsv /drill/testdata/decimal/fragments

if [ "$AUTH_MECHANISM" == "MAPRSASL" ]
then
  ${DRILL_HOME}/bin/sqlline -u "jdbc:drill:schema=dfs.drillTestDir;drillbit=${DRILL_STORAGE_PLUGIN_SERVER};auth=maprsasl" --run=${DRILL_TEST_DATA_DIR}/Datasources/ctas/decimal/fragments/decimal_fragments.ddl
elif [ -z "$PASSWORD" ]
then
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -u "jdbc:drill:schema=dfs.drillTestDir;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" --run=${DRILL_TEST_DATA_DIR}/Datasources/ctas/decimal/fragments/decimal_fragments.ddl
else
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.drillTestDir;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" --run=${DRILL_TEST_DATA_DIR}/Datasources/ctas/decimal/fragments/decimal_fragments.ddl
fi
