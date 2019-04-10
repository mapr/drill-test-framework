#!/bin/bash
source conf/drillTestConfig.properties

hadoop fs -test -d /drill/testdata/metadata_caching/lineitem_addfiles
addfilesExists=$?
hadoop fs -test -d /drill/testdata/metadata_caching/lineitem_addfiles
removefilesExists=$?
hadoop fs -test -d /drill/testdata/metadata_caching/lineitem_adddir
addDirExists=$?
hadoop fs -test -d /drill/testdata/metadata_caching/lineitem_removedir
removeDirExists=$?
hadoop fs -test -d /drill/testdata/metadata_caching/lineitem_addautopartitioned_files
addAutoPartitionExists=$?
hadoop fs -test -d /drill/testdata/metadata_caching/lineitem_removeautopartitioned_files
removeAutoPartitionExists=$?

if [ $addfilesExists -eq 0 ]; then 
  hadoop fs -rm -r /drill/testdata/metadata_caching/lineitem_addfiles
fi
if [ $removefilesExists -eq 0 ]; then
  hadoop fs -rm -r /drill/testdata/metadata_caching/lineitem_removefiles
fi
if [ $addDirExists -eq 0 ]; then
  hadoop fs -rm -r /drill/testdata/metadata_caching/lineitem_adddir
fi
if [ $removeDirExists -eq 0 ]; then
  hadoop fs -rm -r /drill/testdata/metadata_caching/lineitem_removedir
fi
if [ $addAutoPartitionExists -eq 0 ]; then
  hadoop fs -rm -r /drill/testdata/metadata_caching/lineitem_addautopartitioned_files
fi
if [ $removeAutoPartitionExists -eq 0 ]; then
  hadoop fs -rm -r /drill/testdata/metadata_caching/lineitem_removeautopartitioned_files
fi

hadoop fs -copyFromLocal ${DRILL_TEST_DATA_DIR}/Datasources/metadata_caching/data/lineitem_addfiles /drill/testdata/metadata_caching/
hadoop fs -copyFromLocal ${DRILL_TEST_DATA_DIR}/Datasources/metadata_caching/data/lineitem_removefiles /drill/testdata/metadata_caching/
hadoop fs -copyFromLocal ${DRILL_TEST_DATA_DIR}/Datasources/metadata_caching/data/lineitem_adddir /drill/testdata/metadata_caching/
hadoop fs -copyFromLocal ${DRILL_TEST_DATA_DIR}/Datasources/metadata_caching/data/lineitem_removedir /drill/testdata/metadata_caching/
hadoop fs -copyFromLocal ${DRILL_TEST_DATA_DIR}/Datasources/metadata_caching/data/lineitem_addautopartitioned_files /drill/testdata/metadata_caching/
hadoop fs -copyFromLocal ${DRILL_TEST_DATA_DIR}/Datasources/metadata_caching/data/lineitem_removeautopartitioned_files /drill/testdata/metadata_caching/

${DRILL_TEST_DATA_DIR}/Datasources/metadata_caching/delete_cache.sh /drill/testdata/metadata_caching/lineitem_addfiles
${DRILL_TEST_DATA_DIR}/Datasources/metadata_caching/delete_cache.sh /drill/testdata/metadata_caching/lineitem_removefiles
${DRILL_TEST_DATA_DIR}/Datasources/metadata_caching/delete_cache.sh /drill/testdata/metadata_caching/lineitem_adddir
${DRILL_TEST_DATA_DIR}/Datasources/metadata_caching/delete_cache.sh /drill/testdata/metadata_caching/lineitem_removedir
${DRILL_TEST_DATA_DIR}/Datasources/metadata_caching/delete_cache.sh /drill/testdata/metadata_caching/lineitem_addautopartitioned_files
${DRILL_TEST_DATA_DIR}/Datasources/metadata_caching/delete_cache.sh /drill/testdata/metadata_caching/lineitem_removeautopartitioned_files
${DRILL_TEST_DATA_DIR}/Datasources/metadata_caching/delete_cache.sh /drill/testdata/metadata_caching/orders

if [ -z "$PASSWORD" ]
then
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -u "jdbc:drill:schema=dfs.$1;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" --run=${DRILL_TEST_DATA_DIR}/Datasources/metadata_caching/refresh_metadata_addremovefiles.ddl
else
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.$1;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=${DRILL_TEST_DATA_DIR}/Datasources/metadata_caching/refresh_metadata_addremovefiles.ddl
fi

hadoop fs -copyFromLocal -f ${DRILL_TEST_DATA_DIR}/Datasources/metadata_caching/data/lineitem1.parquet /drill/testdata/metadata_caching/lineitem_addfiles/lineitem1.parquet
hadoop fs -rm /drill/testdata/metadata_caching/lineitem_removefiles/lineitem1.parquet
hadoop fs -copyFromLocal -f ${DRILL_TEST_DATA_DIR}/Datasources/metadata_caching/data/feb /drill/testdata/metadata_caching/lineitem_adddir/
hadoop fs -rm -r /drill/testdata/metadata_caching/lineitem_removedir/feb
hadoop fs -copyFromLocal -f ${DRILL_TEST_DATA_DIR}/Datasources/metadata_caching/data/lineitem2.parquet /drill/testdata/metadata_caching/lineitem_addautopartitioned_files/
hadoop fs -rm /drill/testdata/metadata_caching/lineitem_removeautopartitioned_files/lineitem2.parquet

# copy the generated cache file and then validate its contents in the testcases

hadoop fs -test -d /drill/testdata/metadata_caching/generated_caches
generatedCachesExists=$?
if [ $generatedCachesExists -eq 0 ]; then
  hadoop fs -rm -r /drill/testdata/metadata_caching/generated_caches
fi
hadoop fs -mkdir -p /drill/testdata/metadata_caching/generated_caches
hadoop fs -mkdir -p /drill/testdata/metadata_caching/generated_caches/fewtypes_cache
hadoop fs -cp -f /drill/testdata/metadata_caching/fewtypes/.drill.parquet_file_metadata.v4 /drill/testdata/metadata_caching/generated_caches/fewtypes_cache/parquet_file_metadata.json
hadoop fs -cp -f /drill/testdata/metadata_caching/fewtypes/.drill.parquet_summary_metadata.v4 /drill/testdata/metadata_caching/generated_caches/fewtypes_cache/parquet_summary_metadata.json

hadoop fs -mkdir -p /drill/testdata/metadata_caching/generated_caches/fewtypes_varcharpartition_cache
hadoop fs -cp -f /drill/testdata/metadata_caching/fewtypes_varcharpartition/.drill.parquet_file_metadata.v4 /drill/testdata/metadata_caching/generated_caches/fewtypes_varcharpartition_cache/parquet_file_metadata.json
hadoop fs -cp -f /drill/testdata/metadata_caching/fewtypes_varcharpartition/.drill.parquet_summary_metadata.v4 /drill/testdata/metadata_caching/generated_caches/fewtypes_varcharpartition_cache/parquet_summary_metadata.json

hadoop fs -mkdir -p /drill/testdata/metadata_caching/generated_caches/lineitem_cache
hadoop fs -cp -f /drill/testdata/metadata_caching/lineitem/.drill.parquet_file_metadata.v4 /drill/testdata/metadata_caching/generated_caches/lineitem_cache/parquet_file_metadata.json
hadoop fs -cp -f /drill/testdata/metadata_caching/lineitem/.drill.parquet_summary_metadata.v4 /drill/testdata/metadata_caching/generated_caches/lineitem_cache/parquet_summary_metadata.json
hadoop fs -cp -f /drill/testdata/metadata_caching/lineitem/.drill.parquet_metadata_directories /drill/testdata/metadata_caching/generated_caches/lineitem_cache/parquet_metadata_directories
