create table dfs_test.ctas_flatten.`filter2_ctas` as select uid_str, flatten(events) from `data.json` where uid = 1;
select * from dfs_test.ctas_flatten.`filter2_ctas`;
drop table dfs_test.ctas_flatten.`filter2_ctas`;
