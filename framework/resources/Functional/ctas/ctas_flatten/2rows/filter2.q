create table dfs.ctas_flatten.`filter2_ctas` as select uid_str, flatten(events) from `data.json` where uid = 1;
select * from dfs.ctas_flatten.`filter2_ctas`;
drop table dfs.ctas_flatten.`filter2_ctas`;
