create table dfs.ctas_flatten.`filter3_ctas` as select uid, flatten(events) from `data.json` where uid > 1;
select * from dfs.ctas_flatten.`filter3_ctas`;
select 1 from sys.options;
