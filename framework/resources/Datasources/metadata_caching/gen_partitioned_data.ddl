alter session set `planner.width.max_per_node` = 4;
alter session set `planner.memory.max_query_memory_per_node` = 8147483648;
alter session set `store.partition.hash_distribute` = true;

create table lineitem partition by (l_shipdate, l_receiptdate) as select * from dfs.`/drill/testdata/tpch100/lineitem`;
create table orders partition by (o_clerk) as select * from dfs.`/drill/testdata/tpch100/orders`;
create table supplier partition by (s_nationkey) as select * from dfs.`/drill/testdata/tpch100/supplier`;
