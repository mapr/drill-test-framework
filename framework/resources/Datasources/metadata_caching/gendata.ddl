ALTER SESSION SET `store.parquet.block-size` = 698000;
create table lineitem as select * from dfs.`/drill/testdata/tpch100/lineitem`;
create table orders as select * from dfs.`/drill/testdata/tpch100/orders`;
create table customer as select * from dfs.`/drill/testdata/tpch100/customer`;
create table supplier as select * from dfs.`/drill/testdata/tpch100/supplier`;
create table part as select * from dfs.`/drill/testdata/tpch100/part`;
create table partsupp as select * from dfs.`/drill/testdata/tpch100/partsupp`;
create table region as select * from dfs.`/drill/testdata/tpch100/region`;
create table nation as select * from dfs.`/drill/testdata/tpch100/nation`;
