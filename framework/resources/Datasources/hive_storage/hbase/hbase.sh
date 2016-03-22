#!/bin/bash
source conf/drillTestConfig.properties

set -x
set -e

${DRILL_TEST_DATA_DIR}/Datasources/hive_storage/hbase/createHbaseTable.sh

wait

hbase org.apache.hadoop.hbase.mapreduce.ImportTsv -Dmapred.map.tasks.speculative.execution=false -Dmapred.reduce.tasks.speculative.execution=false -Dimporttsv.columns=HBASE_ROW_KEY,onecf:name,twocf:age,twocf:registration,threecf:contributions,threecf:voterzone,fourcf:create_date hbvoter /drill/testdata/hive_storage/votertab

set +x
