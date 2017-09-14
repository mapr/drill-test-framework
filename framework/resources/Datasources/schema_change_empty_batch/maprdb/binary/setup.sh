#!/bin/sh
source conf/drillTestConfig.properties

set -x
set -e

${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/maprdb/binary/copyFiles.sh
${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/maprdb/binary/createTables.sh
${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/maprdb/binary/loadTables.sh

maprcli table cf edit -path ${DRILL_TESTDATA}/schema_change_empty_batch/maprdb/binary/part -cfname data -readperm 'u:'"$USER"'|u:mapr'

maprcli table cf edit -path ${DRILL_TESTDATA}/schema_change_empty_batch/maprdb/binary/partsupp -cfname data -readperm 'u:'"$USER"'|u:mapr'

set +x
