create table dfs.ctas_flatten.`filter1_ctas` as select uid, events, flatten(events) from `data.json` where uid = 1;
select * from dfs.ctas_flatten.`filter1_ctas`;
select 1 from sys.options;
