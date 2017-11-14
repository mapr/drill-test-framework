#!/bin/bash

# Schema change empty batch tests on Hbase tables
table1="schema_change_empty_batch_part"
table2="schema_change_empty_batch_partsupp"
table3="schema_change_empty_batch_empty"
table4="browser_action2"

# Create HBase Tables

echo "[INFO] Dropping existing '${table1}'"

echo "disable '${table1}' ; drop '${table1}'" |hbase shell

echo "[INFO] Creating '${table1}'"

echo "create '${table1}', 'data', {SPLITS => ['1', '10000', '15000', '25000', '99999']}" |hbase shell

echo "[INFO] Dropping existing '${table2}'"

echo "disable '${table2}' ; drop '${table2}'" |hbase shell

echo "[INFO] Creating '${table2}'"

echo "create '${table2}', 'data', {SPLITS => ['1', '10000', '50000', '75000', '100000', '999999']}" |hbase shell

echo "[INFO] Dropping existing '${table3}'"

echo "disable '${table3}' ; drop '${table3}'" |hbase shell

echo "[INFO] Creating '${table3}'"

echo "create '${table3}', 'data', {SPLITS => ['1', '1000']}" |hbase shell

echo "[INFO] Dropping existing '${table4}'"

echo "disable '${table4}' ; drop '${table4}'" |hbase shell

echo "[INFO] Creating '${table4}'"

echo "create '${table4}', 'v', {SPLITS => ['0','1','2','3','4','5','6','7','8','9']}" |hbase shell

echo "[INFO] Inserting rows into '${table4}'"

echo "put 'browser_action2', '1','v:e0', 'abc1'" |hbase shell
echo "put 'browser_action2', '2','v:e0', 'abc2'" |hbase shell
echo "put 'browser_action2', '3','v:e0', 'abc3'" |hbase shell
echo "put 'browser_action2', '4','v:e0', 'abc4'" |hbase shell
echo "put 'browser_action2', '5','v:e0', 'abc5'" |hbase shell
echo "put 'browser_action2', '6','v:e0', 'abc6'" |hbase shell

echo "create 'customer1', 'orders', {SPLITS => ['3', '6']}" |hbase shell
echo "put 'customer1', '1', 'orders:id', '100'" |hbase shell
echo "put 'customer1', '5', 'orders:id', '200'" |hbase shell
echo "put 'customer1', '7', 'orders:id', '300'" |hbase shell

echo "create 'customer2', 'orders', {SPLITS => ['3', '6']}" |hbase shell
echo "put 'customer2', '1', 'orders:id', '100'" |hbase shell
echo "put 'customer2', '5', 'orders:id', '200'" |hbase shell