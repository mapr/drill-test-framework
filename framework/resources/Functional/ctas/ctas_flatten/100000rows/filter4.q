drop table if exists dfs_test.ctas_flatten.`filter4_100000rows_ctas`;
create table dfs_test.ctas_flatten.`filter4_100000rows_ctas` as select uid_str, flatten(events) from `data.json` where uid_str = '01';
--@test
select * from dfs_test.ctas_flatten.`filter4_100000rows_ctas`;
drop table dfs_test.ctas_flatten.`filter4_100000rows_ctas`;
