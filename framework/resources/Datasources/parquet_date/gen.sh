#!/bin/sh
source conf/drillTestConfig.properties

# If directory exists, remove it
hadoop fs -test -d /drill/testdata/parquet_date/metadata_cache
if [ "$?" -eq 0 ]
then
        hadoop fs -rm -r /drill/testdata/parquet_date/metadata_cache
fi

hadoop fs -copyFromLocal ${DRILL_TEST_DATA_DIR}/Datasources/parquet_date/metadata_cache /drill/testdata/parquet_date/metadata_cache
hadoop fs -copyFromLocal ${DRILL_TEST_DATA_DIR}/Datasources/parquet_date/metadata_cache/metadata_cache1.2 /drill/testdata/parquet_date/metadata_cache/metadata_cache1.2_autogen
hadoop fs -copyFromLocal ${DRILL_TEST_DATA_DIR}/Datasources/parquet_date/metadata_cache/metadata_cache1.6 /drill/testdata/parquet_date/metadata_cache/metadata_cache1.6_autogen

hadoop fs -test -d /drill/testdata/parquet_date/auto_partition
if [ "$?" -eq 0 ]
then
        hadoop fs -rm -r /drill/testdata/parquet_date/auto_partition
fi

hadoop fs -copyFromLocal ${DRILL_TEST_DATA_DIR}/Datasources/parquet_date/auto_partition /drill/testdata/parquet_date/auto_partition
hadoop fs -copyFromLocal ${DRILL_TEST_DATA_DIR}/Datasources/parquet_date/auto_partition/item_multipart /drill/testdata/parquet_date/auto_partition/item_multipart_autorefresh
hadoop fs -copyFromLocal ${DRILL_TEST_DATA_DIR}/Datasources/parquet_date/auto_partition/item_single/1.2 /drill/testdata/parquet_date/auto_partition/item_single_1.2


${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs.ctas_parquet;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=${DRILL_TEST_DATA_DIR}/Datasources/parquet_date/metadata_cache.ddl

# TODO: it seems that sqlline does not exit, if one of the queries failed.
if [ "$?" -eq 0 ]
then
        exit 0
else
        echo "ERROR: create table script failed. Rerun create_tables_parquet.ddl to debug failures."
        exit 1
fi
