create table dfs_test.ctas_flatten.`filter7_ctas` as select d.uid, flatten(d.map.rm) from `data.json` d where d.map.rm[0].rptd[0].a = 'foo' or d.sub[1].z2=10;
select * from dfs_test.ctas_flatten.`filter7_ctas`;
drop table dfs_test.ctas_flatten.`filter7_ctas`;
