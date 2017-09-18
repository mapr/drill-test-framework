#!/bin/sh
source conf/drillTestConfig.properties

set -x
${DRILL_TEST_DATA_DIR}/Datasources/hive/execHive.sh ${DRILL_TEST_DATA_DIR}/Datasources/hive_storage/change_metadata1.ddl
${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.ctasAutoPartition;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=${DRILL_TEST_DATA_DIR}/Datasources/hive_storage/change_metadata_drill.sql

${DRILL_TEST_DATA_DIR}/Datasources/hive/execHive.sh ${DRILL_TEST_DATA_DIR}/Datasources/hive_storage/change_metadata2.ddl
sleep 60;
