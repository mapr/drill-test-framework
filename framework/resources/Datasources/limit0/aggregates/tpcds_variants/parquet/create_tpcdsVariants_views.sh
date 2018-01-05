#!/bin/sh
source conf/drillTestConfig.properties

set -x
set -e

if [ -z "$PASSWORD" ]
then
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -u "jdbc:drill:schema=dfs_test.tpcds_sf1_parquet;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}" --run=${DRILL_TEST_DATA_DIR}/Datasources/limit0/aggregates/tpcds_variants/parquet/create_tpcdsVariants_views.sql
else
  ${DRILL_HOME}/bin/sqlline -n ${USERNAME} -p ${PASSWORD} -u "jdbc:drill:schema=dfs_test.tpcds_sf1_parquet;drillbit=${DRILL_STORAGE_PLUGIN_SERVER}"  --run=${DRILL_TEST_DATA_DIR}/Datasources/limit0/aggregates/tpcds_variants/parquet/create_tpcdsVariants_views.sql
fi

set +x
