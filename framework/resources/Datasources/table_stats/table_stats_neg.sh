#!/bin/bash
source conf/drillTestConfig.properties
set -xe
${DRILL_TEST_DATA_DIR}/Datasources/table_stats/delete_stats_neg.sh
wait
${DRILL_TEST_DATA_DIR}/Datasources/table_stats/analyze_tables_neg.sh