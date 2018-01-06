drop table if exists dfs_test.ctas_flatten.`filter24_100000rows_ctas`;
create table dfs_test.ctas_flatten.`filter24_100000rows_ctas` as select * from (select d.type type, flatten(d.events) evnts, flatten(d.features) feats from `data.json` d) s where  s.evnts.type=s.feats.type;
--@test
select * from dfs_test.ctas_flatten.`filter24_100000rows_ctas`;
drop table dfs_test.ctas_flatten.`filter24_100000rows_ctas`;
