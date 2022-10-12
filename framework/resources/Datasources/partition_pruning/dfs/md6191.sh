#!/bin/bash
source conf/drillTestConfig.properties

current_year=$(date "+%Y");
new_data_dir=${DRILL_TESTDATA}/partition_pruning/dfs/lineitem/${current_year}

hadoop fs -rm -r ${new_data_dir}
hadoop fs -mkdir -p ${new_data_dir}
hadoop fs -put ${DRILL_TEST_DATA_DIR}/Datasources/dfs/lineitem/1997/lineitemag.tbl ${new_data_dir}/lineitemah.tbl

if [ "$?" -eq 0 ]
then
        exit 0
else
        echo "ERROR: create table script failed. Rerun md6191.sh to debug failures."
        exit 1
fi