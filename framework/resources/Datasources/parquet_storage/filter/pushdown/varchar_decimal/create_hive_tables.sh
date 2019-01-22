#!/usr/bin/env bash
source conf/drillTestConfig.properties

set -x

test_dir=${DRILL_TEST_DATA_DIR}/Datasources/parquet_storage/filter/pushdown/varchar_decimal
dfs_location=${DRILL_TESTDATA}/filter/pushdown/varchar_decimal/no_metadata_file

hive_ddl=$test_dir/create_hive_tables.ddl
hive_ddl_parametrized=${hive_ddl%.*}_param.ddl
cp $hive_ddl $hive_ddl_parametrized

# Replacing parameters with values:
sed -i "s|dfs_location|$dfs_location|g" $hive_ddl_parametrized

# Executing the ddl:
${DRILL_TEST_DATA_DIR}/Datasources/hive/execHive.sh $hive_ddl_parametrized

# Clean:
rm $hive_ddl_parametrized