-- spill cycle 2 and 4 partitions......max memory 32MB
alter session set `planner.memory.max_query_memory_per_node` = 117127360;
alter session set `planner.width.max_per_node` = 1;
alter session set `planner.width.max_per_query` = 1;
select count(distinct col1) from dfs.`/drill/testdata/resource-manager/small_large_parquet`;
alter session set `planner.memory.max_query_memory_per_node` = 2147483648;
alter session set `planner.width.max_per_node` = 17;
alter session set `planner.width.max_per_query` = 1000;
