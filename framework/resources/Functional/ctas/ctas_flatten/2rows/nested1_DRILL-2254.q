create table dfs_test.ctas_flatten.`nested1_DRILL-2254_ctas` as select uid, flatten(flatten(lst_lst)) from `data1.json`;
select * from dfs_test.ctas_flatten.`nested1_DRILL-2254_ctas`;
drop table dfs_test.ctas_flatten.`nested1_DRILL-2254_ctas`;
