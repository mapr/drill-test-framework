#!/bin/bash
source conf/drillTestConfig.properties

${DRILL_TEST_DATA_DIR}/Datasources/min_max_dir/scripts/delete_cache.sh ${DRILL_TESTDATA}/min_max_dir_metadatacache

wait

if [ -z "$PASSWORD" ]
then
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -u "jdbc:drill:schema=dfs.drillTestDir;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" --run=${DRILL_TEST_DATA_DIR}/Datasources/min_max_dir/scripts/refresh_metadata.ddl
else
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.drillTestDir;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=${DRILL_TEST_DATA_DIR}/Datasources/min_max_dir/scripts/refresh_metadata.ddl
fi

# it seems that sqlline does not exit, if one of the queries failed.
if [ "$?" -eq 0 ]
then
        exit 0
else
        echo "ERROR: refresh_metadata.ddl script failed. Rerun refresh_metadata.ddl to debug failures."
        exit 1
fi
