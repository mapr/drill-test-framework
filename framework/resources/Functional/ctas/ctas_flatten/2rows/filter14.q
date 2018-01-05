create table dfs_test.ctas_flatten.`filter14_ctas` as select  *  from (select d.type type, flatten(d.events) evnts from `data.json` d where d.type='web') s where s.evnts.type = 'cmpgn4';
select * from dfs_test.ctas_flatten.`filter14_ctas`;
drop table dfs_test.ctas_flatten.`filter14_ctas`;
