#!/bin/bash

set -e
hbase shell << EOF
disable 'fewtypes_null'
drop 'fewtypes_null'
create 'fewtypes_null', 'types'
exit
EOF

wait

hbase org.apache.hadoop.hbase.mapreduce.ImportTsv -Dmapred.map.tasks.speculative.execution=false -Dmapred.reduce.tasks.speculative.execution=false -Dimporttsv.columns=HBASE_ROW_KEY,types:int_col,types:bigint_col,types:date_col,types:time_col,types:timestamp_col,types:interval_col,types:varchar_col,types:float_col,types:double_col,types:bool_col fewtypes_null /drill/testdata/cross-sources/fewtypes_null.tsv

