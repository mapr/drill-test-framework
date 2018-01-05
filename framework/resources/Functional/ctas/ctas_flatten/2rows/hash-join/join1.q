create table dfs_test.ctas_flatten.`join1_ctas` as select t1.uid, t1.events from  `data.json` t1, `data.json` t2 where t1.uid = t2.uid;
select * from dfs_test.ctas_flatten.`join1_ctas`;
drop table dfs_test.ctas_flatten.join1_ctas;
