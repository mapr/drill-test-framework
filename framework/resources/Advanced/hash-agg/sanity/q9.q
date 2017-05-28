-- spill cycle 8 and 2 partitions. Max memory 107MB and took ~30mins
alter session set `planner.width.max_per_node` = 1;
alter session set `planner.memory.max_query_memory_per_node` = 250127360;
alter session set `planner.width.max_per_query` = 1;
select count(*), max(`filename`) from dfs.`/drill/testdata/hash-agg/data1` group by no_nulls_col, nulls_col;
alter session set `planner.memory.max_query_memory_per_node` = 2147483648;
alter session set `planner.width.max_per_node` = 17;
alter session set `planner.width.max_per_query` = 1000;
