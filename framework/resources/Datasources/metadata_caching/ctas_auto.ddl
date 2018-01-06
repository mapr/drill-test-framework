alter session set `planner.width.max_per_node` = 4;
alter session set `planner.memory.max_query_memory_per_node` = 8147483648;
create table lineitem partition by (l_shipdate, l_receiptdate) as select * from dfs_test.`/drill/testdata/tpch100/lineitem`;





create table fewtypes_intpartition partition by (int_col) as select * from fewtypes;
create table fewtypes_bigintpartition partition by (bigint_col) as select * from fewtypes;
create table fewtypes_datepartition partition by (date_col) as select * from fewtypes;
create table fewtypes_timepartition partition by (time_col) as select * from fewtypes;
create table fewtypes_timestamppartition partition by (timestamp_col) as select * from fewtypes;
create table fewtypes_intervalpartition partition by (interval_col) as select * from fewtypes;
create table fewtypes_varcharpartition partition by (varchar_col) as select * from fewtypes;
create table fewtypes_floatpartition partition by (float_col) as select * from fewtypes;
create table fewtypes_doublepartition partition by (double_col) as select * from fewtypes;
create table fewtypes_boolpartition partition by (bool_col) as select * from fewtypes;
