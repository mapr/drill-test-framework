-- 6 out of 8 partitions spilled and spill cycle is 1
alter session set `planner.memory.max_query_memory_per_node` = 464127360;
alter session set `planner.width.max_per_node` = 1;
alter session set `planner.width.max_per_query` = 1;
select * from (select max(max_dir) max_dir, col1 from (select max(dir0) max_dir, col1 from dfs.`/drill/testdata/resource-manager/small_large_parquet` group by col1) d where d.max_dir < 1002 group by col1) d1 where d1.max_dir < 100;
alter session set `planner.memory.max_query_memory_per_node` = 2147483648;
alter session set `planner.width.max_per_node` = 17;
alter session set `planner.width.max_per_query` = 1000;
