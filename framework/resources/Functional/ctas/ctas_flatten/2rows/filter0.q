create table dfs_test.ctas_flatten.filter0_ctas as select uid, flatten(events) flatten_evnts from `data.json` where uid = 1;
select * from dfs_test.ctas_flatten.filter0_ctas;
drop table dfs_test.ctas_flatten.filter0_ctas;
