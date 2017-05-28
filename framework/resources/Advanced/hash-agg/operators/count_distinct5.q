-- 30 out of 32 partitions spilled and the spill cycle is 1. Each hash-agg minor fragment got ~583MB
alter session set `planner.memory.max_query_memory_per_node` = 1607483648;
alter session set `planner.width.max_per_node` = 1;
alter session set `planner.width.max_per_query` = 1;
select count (distinct columns[0]) from dfs.`/drill/testdata/hash-agg/uuid.tbl`;
alter session set `planner.width.max_per_node` = 17;
alter session set `planner.width.max_per_query` = 1000;
alter session set `planner.memory.max_query_memory_per_node` = 1607483648;
