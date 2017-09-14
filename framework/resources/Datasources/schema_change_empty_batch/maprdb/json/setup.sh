#!/bin/sh
source conf/drillTestConfig.properties

set -x
set -e

if ! $(hadoop fs -test -d ${DRILL_TESTDATA}/schema_change_empty_batch/maprdb/json)
    then

        hadoop fs -mkdir -p ${DRILL_TESTDATA}/schema_change_empty_batch/maprdb/json

        hadoop fs -put ${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/data/json/*.json $DRILL_TESTDATA/schema_change_empty_batch/maprdb/json/

fi

javac -cp ${HADOOP_INSTALL_LOC}/lib/*:${HADOOP_INSTALL_LOC}/hadoop/hadoop-2.7.0/share/hadoop/common/hadoop-common-2.7.0-mapr*.jar:framework/target/* ${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/maprdb/json/CreateTable.java

java -cp ${HADOOP_INSTALL_LOC}/lib/*:${HADOOP_INSTALL_LOC}/hadoop/hadoop-2.7.0/share/hadoop/common/hadoop-common-2.7.0-mapr*.jar:framework/target/*:${DRILL_TEST_DATA_DIR}/Datasources/schema_change_empty_batch/maprdb/json CreateTable

mapr importJSON -src ${DRILL_TESTDATA}/schema_change_empty_batch/maprdb/json/part.json -dst ${DRILL_TESTDATA}/schema_change_empty_batch/maprdb/json/part -idfield row_key -bulkload true -mapreduce true

mapr importJSON -src ${DRILL_TESTDATA}/schema_change_empty_batch/maprdb/json/partsupp.json -dst ${DRILL_TESTDATA}/schema_change_empty_batch/maprdb/json/partsupp -idfield row_key -bulkload true -mapreduce true

mapr importJSON -src ${DRILL_TESTDATA}/schema_change_empty_batch/maprdb/json/partsupp.json -dst ${DRILL_TESTDATA}/schema_change_empty_batch/maprdb/json/partsupp1 -idfield row_key -bulkload true -mapreduce true

maprcli table cf edit -path ${DRILL_TESTDATA}/schema_change_empty_batch/maprdb/json/part -cfname default -readperm 'u:'"$USER"'|u:mapr'

maprcli table cf edit -path ${DRILL_TESTDATA}/schema_change_empty_batch/maprdb/json/partsupp -cfname default -readperm 'u:'"$USER"'|u:mapr'

maprcli table cf edit -path ${DRILL_TESTDATA}/schema_change_empty_batch/maprdb/json/partsupp1 -cfname default -readperm 'u:'"$USER"'|u:mapr'
