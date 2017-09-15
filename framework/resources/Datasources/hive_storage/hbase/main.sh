#!/bin/bash
source conf/drillTestConfig.properties

set -x
set -e

${DRILL_TEST_DATA_DIR}/Datasources/hive_storage/hbase/hbase.sh

wait

${DRILL_TEST_DATA_DIR}/Datasources/hive/execHive.sh ${DRILL_TEST_DATA_DIR}/Datasources/hive_storage/hive_hbase.q

set +x
