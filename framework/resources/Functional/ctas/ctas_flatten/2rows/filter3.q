create table dfs_test.ctas_flatten.`filter3_ctas` as select uid, flatten(events) from `data.json` where uid > 1;
select * from dfs_test.ctas_flatten.`filter3_ctas`;
drop table dfs_test.ctas_flatten.`filter3_ctas`;
