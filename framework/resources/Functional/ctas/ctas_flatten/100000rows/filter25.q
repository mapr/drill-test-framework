drop table if exists dfs_test.ctas_flatten.`filter25_100000rows_ctas`;
create table dfs_test.ctas_flatten.`filter25_100000rows_ctas` as select * from (select s1.type type, flatten(s1.rms.rptd) rptds from (select d.type type, flatten(d.map.rm) rms from `data.json` d) s1 where s1.rms.mapid='m2') s2 where s2.rptds.c > 0 and s2.type='web';
--@test
select * from dfs_test.ctas_flatten.`filter25_100000rows_ctas`;
drop table dfs_test.ctas_flatten.`filter25_100000rows_ctas`;
