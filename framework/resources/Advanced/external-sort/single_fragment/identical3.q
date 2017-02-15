ALTER SESSION SET `exec.sort.disable_managed` = false;
alter session set `planner.width.max_per_node` = 1;
alter session set `planner.width.max_per_query` = 1;
alter session set `planner.memory.max_query_memory_per_node` = 204857600;
select count(*) from (select * from dfs.`/drill/testdata/resource-manager/identical` order by col1, col2, col3, col4, col5, col6, col7, col8, col9, col10);
ALTER SESSION SET `exec.sort.disable_managed` = true;
alter session set `planner.width.max_per_node` = 17;
alter session set `planner.width.max_per_query` = 1000;
alter session set `planner.memory.max_query_memory_per_node` = 2147483648;
