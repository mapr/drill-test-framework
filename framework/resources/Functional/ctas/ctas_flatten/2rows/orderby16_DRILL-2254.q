create table dfs_test.ctas_flatten.`orderby16_DRILL-2254_ctas` as select * from (select uid, flatten(d.lst_lst[1]) lst1, flatten(d.lst_lst) lst from `data.json` d) s1 order by s1.lst[3], s1.lst1;
select * from dfs_test.ctas_flatten.`orderby16_DRILL-2254_ctas`;
drop table dfs_test.ctas_flatten.`orderby16_DRILL-2254_ctas`;
