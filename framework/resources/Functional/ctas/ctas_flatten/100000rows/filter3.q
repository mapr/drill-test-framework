drop table if exists dfs.ctas_flatten.`filter3_100000rows_ctas`;
create table dfs.ctas_flatten.`filter3_100000rows_ctas` as select uid, flatten(events) from `data.json` where uid > 1;
--@test
select * from dfs.ctas_flatten.`filter3_100000rows_ctas`;
drop table dfs.ctas_flatten.`filter3_100000rows_ctas`;
