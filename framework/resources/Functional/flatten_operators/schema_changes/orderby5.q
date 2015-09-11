select * from (select d.uid uid, flatten(d.events) evnts from `schema_changes` d) s order by s.uid, s.evnts.campaign_id, s.evnts.event_time;
