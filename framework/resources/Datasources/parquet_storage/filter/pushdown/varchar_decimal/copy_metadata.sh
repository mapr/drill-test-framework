#!/usr/bin/env bash
source conf/drillTestConfig.properties

set -x

test_dir=${DRILL_TEST_DATA_DIR}/Datasources/parquet_storage/filter/pushdown/varchar_decimal
dfs_location=${DRILL_TESTDATA}/filter/pushdown/varchar_decimal

copy_to_dfs() {
    local metadata_file=$test_dir/$1
    local destination=$dfs_location/$1

    hadoop fs -rm $destination
#   We need to copy the metadata files separately because otherwise Drill considers the tables as modified and auto refreshes metadata.
#   Using "hadoop fs -put" doesn't help for some reason.
    hadoop fs -touchz $destination
    hadoop fs -appendToFile $metadata_file $destination
}

#   Finding all metadata files and extracting 3 last directories of the path, then copying to dfs.
for file in $(find ${test_dir} -name .drill.parquet_metadata | grep -oE "[^/]+/[^/]+/[^/]+/[^/]+$")
do
    copy_to_dfs $file
done