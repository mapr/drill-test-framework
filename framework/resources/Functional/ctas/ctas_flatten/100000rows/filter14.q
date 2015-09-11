create table dfs.ctas_flatten.`filter14_100000rows_ctas` as select  *  from (select d.type type, flatten(d.events) evnts from `data.json` d where d.type='web') s where s.evnts.type = 'cmpgn4';
select * from dfs.ctas_flatten.`filter14_100000rows_ctas`;
select 1 from sys.options;
