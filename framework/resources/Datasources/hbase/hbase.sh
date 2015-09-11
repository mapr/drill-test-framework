#!/bin/bash

set -x
set -e

resources/Datasources/hbase/createHbaseTables.sh

wait

hbase org.apache.hadoop.hbase.mapreduce.ImportTsv -Dmapred.map.tasks.speculative.execution=false -Dmapred.reduce.tasks.speculative.execution=false -Dimporttsv.columns=HBASE_ROW_KEY,onecf:name,twocf:age,twocf:registration,threecf:contributions,threecf:voterzone,fourcf:create_date voter /drill/testdata/hbase/votertab

hbase org.apache.hadoop.hbase.mapreduce.ImportTsv -Dmapred.map.tasks.speculative.execution=false -Dmapred.reduce.tasks.speculative.execution=false -Dimporttsv.columns=HBASE_ROW_KEY,onecf:name,twocf:age,threecf:gpa,fourcf:studentnum,fivecf:create_date student /drill/testdata/hbase/studenttab

set +x
