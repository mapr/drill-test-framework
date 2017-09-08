#!/bin/bash
source conf/drillTestConfig.properties

set -e

hbase org.apache.hadoop.hbase.mapreduce.Import schema_change_empty_batch_part ${DRILL_TESTDATA}/schema_change_empty_batch/hbase/data/part/
hbase org.apache.hadoop.hbase.mapreduce.Import schema_change_empty_batch_partsupp ${DRILL_TESTDATA}/schema_change_empty_batch/hbase/data/partsupp/
