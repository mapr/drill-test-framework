create table dfs_test.ctas_flatten.`filter21_ctas` as select  s.rms.mapid  from (select d.type type, flatten(d.map.rm) rms from `data.json` d where d.map.rm[0].mapid='m1') s where s.rms.mapid='m2';
select * from dfs_test.ctas_flatten.`filter21_ctas`;
drop table dfs_test.ctas_flatten.`filter21_ctas`;
