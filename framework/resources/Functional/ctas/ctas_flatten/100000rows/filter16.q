drop table if exists dfs_test.ctas_flatten.`filter16_100000rows_ctas`;
create table dfs_test.ctas_flatten.`filter16_100000rows_ctas` as select  s.rms.mapid  from (select d.type type, flatten(d.map.rm) rms from `data.json` d where d.map.rm[0].mapid='m1') s where s.rms.mapid='m2';
--@test
select * from dfs_test.ctas_flatten.`filter16_100000rows_ctas`;
drop table dfs_test.ctas_flatten.`filter16_100000rows_ctas`;
