create table dfs.ctas_flatten.filter0_ctas as select uid, flatten(events) flatten_evnts from `data.json` where uid = 1;
select * from dfs.ctas_flatten.filter0_ctas;
select 1 from sys.options;
