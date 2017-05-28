-- no spilling but just added a testcase
alter session set `planner.memory.max_query_memory_per_node` = 234127360;
alter session set `planner.width.max_per_node` = 1;
alter session set `planner.width.max_per_query` = 1;
select * from (select max(col1) max_col1, dir0 from dfs.`/drill/testdata/resource-manager/small_large_parquet` group by dir0) d where d.max_col1 < 100;
alter session set `planner.memory.max_query_memory_per_node` = 2147483648;
alter session set `planner.width.max_per_node` = 17;
alter session set `planner.width.max_per_query` = 1000;
