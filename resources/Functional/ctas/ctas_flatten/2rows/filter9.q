create table dfs.ctas_flatten.`filter9_ctas` as select d.uid, flatten(d.map.rm), flatten(d.events) from `data.json` d where d.map.rm[0].rptd[0].a = 'foo' and d.events[4].type = 'cmpgn3';
select * from dfs.ctas_flatten.`filter9_ctas`;
select 1 from sys.options;
