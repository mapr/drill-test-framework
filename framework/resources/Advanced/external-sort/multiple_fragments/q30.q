alter session set `exec.sort.disable_managed` = false;
alter session set `planner.width.max_per_query` = 17;
select count(*) from (select * from dfs.`/drill/testdata/resource-manager/5kwidecolumns_500k.tbl` order by columns[0]) d where d.columns[0] = '4041054511';
alter session set `exec.sort.disable_managed` = true;
alter session set `planner.width.max_per_query` = 1000;
