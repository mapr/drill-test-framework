#!/bin/sh

sf=$1

source conf/drillTestConfig.properties

${DRILL_TEST_DATA_DIR}/Datasources/tpcds/maprdb/json/importTables.sh $sf
${DRILL_TEST_DATA_DIR}/Datasources/tpcds/maprdb/json/createViews.sh
