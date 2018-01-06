create table dfs_test.ctas_flatten.`filter6_ctas` as select d.uid, flatten(d.map.rm) from `data.json` d where d.map.rm[0].rptd[0].a = 'foo';
select * from dfs_test.ctas_flatten.`filter6_ctas`;
drop table dfs_test.ctas_flatten.`filter6_ctas`;
