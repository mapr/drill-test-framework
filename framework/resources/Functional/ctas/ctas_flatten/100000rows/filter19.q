drop table if exists dfs.ctas_flatten.`filter19_100000rows_ctas`;
create table dfs.ctas_flatten.`filter19_100000rows_ctas` as select * from (select d.type type, flatten(d.events) evnts, flatten(d.features) feats from `data.json` d) s where  s.evnts.type=s.feats.type;
--@test
select * from dfs.ctas_flatten.`filter19_100000rows_ctas`;
drop table dfs.ctas_flatten.`filter19_100000rows_ctas`;
