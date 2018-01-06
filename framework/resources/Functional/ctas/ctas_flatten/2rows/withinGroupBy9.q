create table dfs_test.ctas_flatten.`withinGroupBy9_ctas` as select uid, MAX(l1+l2) from (select uid,flatten(lst_lst[1]) l1, flatten(lst_lst[0]) l2 from `data.json`) sub group by uid, l1, l2;
select * from dfs_test.ctas_flatten.`withinGroupBy9_ctas`;
drop table dfs_test.ctas_flatten.`withinGroupBy9_ctas`;
