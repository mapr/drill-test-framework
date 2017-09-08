#!/bin/sh
source conf/drillTestConfig.properties

set -x
set -e

${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/maprdb/binary/copyFiles.sh
${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/maprdb/binary/createTables.sh
${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/maprdb/binary/loadTables.sh

set +x
