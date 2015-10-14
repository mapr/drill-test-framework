select * from (select d.uid uid, flatten(d.events) evnts from `schema_changes` d order by d.uid) s order by s.evnts.event_time;
