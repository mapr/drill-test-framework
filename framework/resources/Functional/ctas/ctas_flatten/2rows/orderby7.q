create table dfs_test.ctas_flatten.`orderby7_ctas` as select s.uid from (select d.uid, flatten(d.map.rm) rms from `data.json` d) s order by s.rms.rptd[1].d;
select * from dfs_test.ctas_flatten.`orderby7_ctas`;
drop table dfs_test.ctas_flatten.`orderby7_ctas`;
