create table dfs_test.ctas_flatten.`orderby4_ctas` as select * from (select d.uid uid, flatten(d.events) evnts from `data.json` d order by d.uid) s order by s.evnts.campaign_id, s.evnts.event_time;
select * from dfs_test.ctas_flatten.`orderby4_ctas`;
drop table dfs_test.ctas_flatten.`orderby4_ctas`;
