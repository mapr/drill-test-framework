create table dfs.ctas_flatten.`orderby5_ctas` as select * from (select d.uid uid, flatten(d.events) evnts from `data.json` d) s order by s.uid, s.evnts.campaign_id, s.evnts.event_time;
select * from dfs.ctas_flatten.`orderby5_ctas`;
select 1 from sys.options;
