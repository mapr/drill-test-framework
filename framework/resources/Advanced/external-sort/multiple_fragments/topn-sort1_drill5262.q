ALTER SESSION SET `exec.sort.disable_managed` = false;
alter session set `planner.memory.max_query_memory_per_node` = 37127360;
select count(*) from (select * from (select * from dfs.`/drill/testdata/resource-manager/small_large_parquet/1001` order by col1 desc limit 4835450) as d order by d.col1 asc) as d1;
ALTER SESSION SET `exec.sort.disable_managed` = true;
alter session set `planner.memory.max_query_memory_per_node` = 2147483648;
