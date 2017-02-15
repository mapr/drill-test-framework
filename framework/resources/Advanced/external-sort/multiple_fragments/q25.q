ALTER SESSION SET `exec.sort.disable_managed` = false;
alter session set `planner.width.max_per_query` = 100;
alter session set `planner.enable_hashagg` = false;
select count(*) from (select d.col1 from (select distinct columns[0] col1 from dfs.`/drill/testdata/resource-manager/250wide.tbl`) d order by d.col1)d2 where d2.col1 = 'askjdhfjhfds';
ALTER SESSION SET `exec.sort.disable_managed` = true;
alter session set `planner.width.max_per_query` = 1000;
alter session set `planner.enable_hashagg` = true;
