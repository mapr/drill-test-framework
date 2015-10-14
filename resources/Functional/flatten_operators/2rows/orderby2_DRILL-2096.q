select * from (select d.uid uid, d.events events, flatten(d.events) events_flatten from `data.json` d order by d.uid) s order by s.events_flatten.event_time;
