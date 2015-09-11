select * from (select d.uid uid, flatten(d.events) evnts from `data.json` d) s order by s.uid, s.evnts.campaign_id, s.evnts.event_time;
