create table dfs_test.ctas_flatten.`join6_ctas` as select flatten(sub1.lst_lst[0])  from (select t1.lst_lst lst_lst from `data.json` t1 inner join `data.json` t2 on t1.uid=t2.uid) sub1;
select * from dfs_test.ctas_flatten.`join6_ctas`;
drop table dfs_test.ctas_flatten.`join6_ctas`;
