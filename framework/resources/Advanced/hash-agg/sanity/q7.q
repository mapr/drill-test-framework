-- no spilling...due to insufficient memory the code went back to using the old code and the old code did not respect my memory constraints....took ~13 minutes
alter session set `planner.width.max_per_node` = 1;
alter session set `planner.memory.max_query_memory_per_node` = 117127360;
alter session set `planner.width.max_per_query` = 1;
select count(*) from (select max(nulls_col), max(length(nulls_col)), max(`filename`) from dfs.`/drill/testdata/hash-agg/data1` group by no_nulls_col) d;
alter session set `planner.memory.max_query_memory_per_node` = 2147483648;
alter session set `planner.width.max_per_node` = 17;
alter session set `planner.width.max_per_query` = 1000;
