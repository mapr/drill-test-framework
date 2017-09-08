#!/bin/bash
source conf/drillTestConfig.properties

set -e
set -x

hbase org.apache.hadoop.hbase.mapreduce.Import ${DRILL_TESTDATA}/schema_change_empty_batch/maprdb/binary/part ${DRILL_TESTDATA}/schema_change_empty_batch/maprdb/binary/data/part/
hbase org.apache.hadoop.hbase.mapreduce.Import ${DRILL_TESTDATA}/schema_change_empty_batch/maprdb/binary/partsupp ${DRILL_TESTDATA}/schema_change_empty_batch/maprdb/binary/data/partsupp/
