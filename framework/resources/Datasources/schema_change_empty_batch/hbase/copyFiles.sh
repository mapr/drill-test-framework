#!/bin/sh
source conf/drillTestConfig.properties

set -x
set -e

if ! $(hadoop fs -test -d ${DRILL_TESTDATA}/schema_change_empty_batch/hbase/data)
    then

        hadoop fs -mkdir -p ${DRILL_TESTDATA}/schema_change_empty_batch/hbase/data

        hadoop fs -put ${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/data/hbase/* ${DRILL_TESTDATA}/schema_change_empty_batch/hbase/data/

fi

set +x
