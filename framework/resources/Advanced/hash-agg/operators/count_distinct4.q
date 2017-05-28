-- 2 out of 2 partitions spilled and the spill cycle is 3. Each hash-agg minor fragment got ~42MB
alter session set `planner.width.max_per_node` = 7;
alter session set `planner.width.max_per_query` = 7;
select count (distinct columns[0]) from dfs.`/drill/testdata/hash-agg/uuid`;
alter session set `planner.width.max_per_node` = 17;
alter session set `planner.width.max_per_query` = 1000;
