#!/bin/bash
source conf/drillTestConfig.properties

# Schema change null batch tests on Hbase tables
table1="part"
table2="partsupp"
table3="empty"

# Location of Tables
path="${DRILL_TESTDATA}/schema_change_empty_batch/maprdb/binary"

# Create HBase Tables

echo "[INFO] Dropping existing '${path}/${table1}'"

echo "disable '${path}/${table1}' ; drop '${path}/${table1}'" |hbase shell

echo "[INFO] Creating '${path}/${table1}'"

echo "create '${path}/${table1}', 'data', {SPLITS => ['1', '1000', '10000', '99999']}" |hbase shell

echo "[INFO] Dropping existing '${path}/${table2}'"

echo "disable '${path}/${table2}' ; drop '${path}/${table2}'" |hbase shell

echo "[INFO] Creating '${path}/${table2}'"

echo "create '${path}/${table2}', 'data', {SPLITS => ['1', '10000', '40000', '50000', '999999']}" |hbase shell

echo "[INFO] Dropping existing '${path}/${table3}'"

echo "disable '${path}/${table3}' ; drop '${path}/${table3}'" |hbase shell

echo "[INFO] Creating '${path}/${table3}'"

echo "create '${path}/${table3}', 'data', {SPLITS => ['1', '1000']}" |hbase shell
