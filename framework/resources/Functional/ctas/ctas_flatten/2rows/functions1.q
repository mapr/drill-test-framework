create table dfs_test.ctas_flatten.`functions1_ctas` as select MAX(sub.val) from (select flatten(d.lst_lst[0]) val from `data1.json` d) sub;
select * from dfs_test.ctas_flatten.`functions1_ctas`;
drop table dfs_test.ctas_flatten.`functions1_ctas`;
