ALTER SESSION SET `exec.sort.disable_managed` = false;
select count(*) from (select * from dfs.`/drill/testdata/resource-manager/250wide.tbl` order by columns[0])d where d.columns[0] = 'ljdfhwuehnoiueyf';
ALTER SESSION SET `exec.sort.disable_managed` = true;
