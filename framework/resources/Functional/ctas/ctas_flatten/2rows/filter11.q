create table dfs.ctas_flatten.`filter11_ctas` as select d.uid, d.type, flatten(events), flatten(transactions) from `data.json` d where d.type='web';
select * from dfs.ctas_flatten.`filter11_ctas`;
select 1 from sys.options;
