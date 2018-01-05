create table dfs_test.ctas_flatten.`filter11_ctas` as select d.uid, d.type, flatten(events), flatten(transactions) from `data.json` d where d.type='web';
select * from dfs_test.ctas_flatten.`filter11_ctas`;
drop table dfs_test.ctas_flatten.`filter11_ctas`;
