create table dfs.ctas_flatten.`filter6_ctas` as select d.uid, flatten(d.map.rm) from `data.json` d where d.map.rm[0].rptd[0].a = 'foo';
select * from dfs.ctas_flatten.`filter6_ctas`;
select 1 from sys.options;
