#!/bin/bash
source conf/drillTestConfig.properties

ddl_file=$1
schema_name=$2
schema_location=$3
partition_pruning_ddl=$4

test_data_path="$schema_location/DRILL_6173"
test_src="Transitive_closure.csv"

if [ -z "$PASSWORD" ]
then
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -u "jdbc:drill:schema=dfs.$schema_name;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" --run=${DRILL_TEST_DATA_DIR}/Datasources/ctas/$ddl_file
else
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.$schema_name;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" --run=${DRILL_TEST_DATA_DIR}/Datasources/ctas/$ddl_file
fi

if [ $# -eq 4 ]
then
#    hive -f "${DRILL_TEST_DATA_DIR}$partition_pruning_ddl"
  ${DRILL_TEST_DATA_DIR}/Datasources/hive/execHive.sh  "${DRILL_TEST_DATA_DIR}$partition_pruning_ddl"
fi
