create table dfs.ctas_flatten.`orderby0_ctas` as select d.uid, flatten(d.events) from `data.json` d order by d.uid;
select * from dfs.ctas_flatten.`orderby0_ctas`;
drop table dfs.ctas_flatten.`orderby0_ctas`;
