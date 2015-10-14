create table dfs.ctas_flatten.`orderby7_ctas` as select s.uid from (select d.uid, flatten(d.map.rm) rms from `data.json` d) s order by s.rms.rptd[1].d;
select * from dfs.ctas_flatten.`orderby7_ctas`;
select 1 from sys.options;
