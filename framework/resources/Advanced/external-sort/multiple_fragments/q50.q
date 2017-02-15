ALTER SESSION SET `exec.sort.disable_managed` = false;
alter session set `planner.memory.max_query_memory_per_node` = 629145600;
select count(*) from (select * from (select columns[0] col1, FQN, filepath, filename, suffix from dfs.`/drill/testdata/resource-manager/250wide-small.tbl` order by filepath, filename,FQN,suffix))d where d.filename = 'ljdfhwuehnoiueyf';
ALTER SESSION SET `exec.sort.disable_managed` = true;
alter session set `planner.memory.max_query_memory_per_node` = 2147483648;
