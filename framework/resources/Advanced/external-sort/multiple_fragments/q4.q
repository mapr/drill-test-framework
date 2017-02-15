ALTER SESSION SET `exec.sort.disable_managed` = false;
alter session set `planner.memory.max_query_memory_per_node` = 1048576;
alter session set `planner.width.max_per_query` = 17;
select count(*) from (select * from dfs.`/drill/testdata/resource-manager/nums.tbl` order by columns[0]) d where d.columns[0] = '4041054511';
ALTER SESSION SET `exec.sort.disable_managed` = false;
alter session set `planner.memory.max_query_memory_per_node` = 1048576;
alter session set `planner.width.max_per_query` = 1000;
