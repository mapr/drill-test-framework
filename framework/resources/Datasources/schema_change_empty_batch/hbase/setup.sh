#!/bin/sh
source conf/drillTestConfig.properties

set -x
set -e

${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/hbase/copyFiles.sh
${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/hbase/createTables.sh
${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/hbase/loadTables.sh

set +x
