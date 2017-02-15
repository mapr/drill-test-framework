alter session set `planner.width.max_per_query` = 1;
ALTER SESSION SET `exec.sort.disable_managed` = false;
alter session set `planner.memory.max_query_memory_per_node` = 1048576;
select count(*) from (select * from dfs.`/drill/testdata/resource-manager/250-tiny.tbl` order by columns[0])d where d.columns[0] = 'ljdfhwuehnoiueyf';
alter session set `planner.width.max_per_query` = 1000;
ALTER SESSION SET `exec.sort.disable_managed` = true;
alter session set `planner.memory.max_query_memory_per_node` = 2147483648;
