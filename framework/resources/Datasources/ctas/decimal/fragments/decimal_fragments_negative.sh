#!/bin/bash
source conf/drillTestConfig.properties

mkdir ${DRILL_TEST_DATA_DIR}/Datasources/ctas/decimal/fragments/negative

tar -xzmvf ${DRILL_TEST_DATA_DIR}/Datasources/ctas/decimal/fragments/decimal_big_zero_scale.tar.gz -C ${DRILL_TEST_DATA_DIR}/Datasources/ctas/decimal/fragments/negative

hadoop fs -mkdir -p /drill/testdata/decimal/fragments/negative

hadoop fs -put ${DRILL_TEST_DATA_DIR}/Datasources/ctas/decimal/fragments/negative/decimal_big_zero_scale.tsv /drill/testdata/decimal/fragments/negative

if [ -z "$PASSWORD" ]
then
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -u "jdbc:drill:schema=dfs.$schema_name;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" --run=${DRILL_TEST_DATA_DIR}/Datasources/ctas/decimal/fragments/decimal_fragments_negative.ddl
else
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.$schema_name;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" --run=${DRILL_TEST_DATA_DIR}/Datasources/ctas/decimal/fragments/decimal_fragments_negative.ddl
fi
