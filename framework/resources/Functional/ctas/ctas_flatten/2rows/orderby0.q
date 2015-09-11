create table dfs.ctas_flatten.`orderby0_ctas` as select d.uid, flatten(d.events) from `data.json` d order by d.uid;
select * from dfs.ctas_flatten.`orderby0_ctas`;
select 1 from sys.options;
