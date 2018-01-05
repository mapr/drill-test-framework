create table dfs_test.ctas_flatten.`orderby0_ctas` as select d.uid, flatten(d.events) from `data.json` d order by d.uid;
select * from dfs_test.ctas_flatten.`orderby0_ctas`;
drop table dfs_test.ctas_flatten.`orderby0_ctas`;
