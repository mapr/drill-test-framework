ALTER SESSION SET `exec.sort.disable_managed` = false;
alter session set `planner.width.max_per_query` = 17;
select count(*) from (select * from dfs.`/drill/testdata/resource-manager/250wide.tbl` order by columns[0])d where d.columns[0] = 'ljdfhwuehnoiueyf';
ALTER SESSION SET `exec.sort.disable_managed` = true;
alter session set `planner.width.max_per_query` = 1000;
