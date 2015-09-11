select t2.uid, t1.trans_id, t2.event.evnt_id from `json_kvgenflatten/scalar.json` t1 inner join `json_kvgenflatten/map.json` t2 on t1.max_event_time=t2.event.event_time;
