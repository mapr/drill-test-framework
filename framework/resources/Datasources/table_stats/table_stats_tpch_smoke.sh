#!/bin/bash
source conf/drillTestConfig.properties
set -xe
${DRILL_TEST_DATA_DIR}/Datasources/table_stats/delete_tpch_smoke_stats.sh
wait
${DRILL_TEST_DATA_DIR}/Datasources/table_stats/analyze_tpch_smoke.sh