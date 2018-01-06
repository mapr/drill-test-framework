create table dfs_test.ctas_flatten.`orderby15_DRILL-2254_ctas` as select s1.* from (select uid, flatten(d.lst_lst[1]) lst1, flatten(d.lst_lst) lst from `data.json` d) s1 order by lst1, s1.lst[4];
select * from dfs_test.ctas_flatten.`orderby15_DRILL-2254_ctas`;
drop table dfs_test.ctas_flatten.`orderby15_DRILL-2254_ctas`;
