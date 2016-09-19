#!/bin/bash
source conf/drillTestConfig.properties

set -x
set -e

${DRILL_TEST_DATA_DIR}/Datasources/describe/hbase/createHbaseTables.sh

wait

hbase org.apache.hadoop.hbase.mapreduce.ImportTsv -Dmapred.map.tasks.speculative.execution=false -Dmapred.reduce.tasks.speculative.execution=false -Dimporttsv.columns=HBASE_ROW_KEY,onecf:name,twocf:age,threecf:gpa,fourcf:studentnum,fivecf:create_date student_describe /drill/testdata/describe/hbase/studenttab

set +x
