#!/bin/sh
source conf/drillTestConfig.properties

if [ -z "$PASSWORD" ]
then
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -u "jdbc:drill:schema=dfs.$1;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" --run=${DRILL_TEST_DATA_DIR}/Datasources/metadata_caching/refresh_metadata_deletecache.ddl
else
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.$1;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=${DRILL_TEST_DATA_DIR}/Datasources/metadata_caching/refresh_metadata_deletecache.ddl
fi

hadoop fs -test /drill/testdata/metadata_caching/lineitem_deletecache/.drill.parquet_metadata
cacheExists=$?

if [ $cacheExists -eq 0 ]; then
  hadoop fs -rm /drill/testdata/metadata_caching/lineitem_deletecache/.drill.parquet_metadata
fi
