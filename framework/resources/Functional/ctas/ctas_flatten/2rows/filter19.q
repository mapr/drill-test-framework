create table dfs_test.ctas_flatten.`filter19_ctas` as select * from (select d.type type, flatten(d.events) evnts, flatten(d.features) feats from `data.json` d) s where  s.evnts.type=s.feats.type;
select * from dfs_test.ctas_flatten.`filter19_ctas`;
drop table dfs_test.ctas_flatten.`filter19_ctas`;
