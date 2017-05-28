-- spill cycle 8 and 2 partitions. Max memory 107MB and took ~30mins
alter session set `planner.width.max_per_node` = 5;
alter session set `planner.width.max_per_query` = 5;
select count(*) from ( select nulls_col from dfs.`/drill/testdata/hash-agg/data1` group by nulls_col, no_nulls_col) d;
alter session set `planner.width.max_per_node` = 17;
alter session set `planner.width.max_per_query` = 1000;
