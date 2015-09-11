create table dfs.ctas_flatten.`orderby1_ctas` as select * from (select d.uid uid, flatten(d.events) evnts from `data.json` d order by d.uid) s order by s.evnts.event_time;
select * from dfs.ctas_flatten.`orderby1_ctas`;
select 1 from sys.options;
