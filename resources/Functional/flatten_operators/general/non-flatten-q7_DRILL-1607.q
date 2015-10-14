select avg(s.e.event_time) from (select flatten(events) e from `data.json`) s;
