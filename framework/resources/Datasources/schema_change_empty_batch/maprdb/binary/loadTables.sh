#!/bin/bash
source conf/drillTestConfig.properties

set -e
set -x

hbase org.apache.hadoop.hbase.mapreduce.ImportTsv -Dmapred.reduce.tasks.speculative.execution=false -Dimporttsv.columns=HBASE_ROW_KEY,data:p_partkey,data:p_name,data:p_mfgr,data:p_brand,data:p_type,data:p_size,data:p_container,data:p_retailprice,data:p_comment ${DRILL_TESTDATA}/schema_change_empty_batch/maprdb/binary/part ${DRILL_TESTDATA}/schema_change_empty_batch/maprdb/binary/data/part.tsv
hbase org.apache.hadoop.hbase.mapreduce.ImportTsv -Dmapred.map.tasks.speculative.execution=false -Dimporttsv.columns=HBASE_ROW_KEY,data:ps_partkey,data:ps_suppkey,data:ps_availqty,data:ps_supplycost,data:ps_comment ${DRILL_TESTDATA}/schema_change_empty_batch/maprdb/binary/partsupp ${DRILL_TESTDATA}/schema_change_empty_batch/maprdb/binary/data/partsupp.tsv
