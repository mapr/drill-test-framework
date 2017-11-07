#!/bin/sh
source conf/drillTestConfig.properties

set -x
set -e

hadoop fs -rm -r -f ${DRILL_TESTDATA}/schema_change_empty_batch/maprdb/binary/data
hadoop fs -mkdir -p ${DRILL_TESTDATA}/schema_change_empty_batch/maprdb/binary/data

hadoop fs -put -f ${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/data/tsv/* ${DRILL_TESTDATA}/schema_change_empty_batch/maprdb/binary/data/

set +x
