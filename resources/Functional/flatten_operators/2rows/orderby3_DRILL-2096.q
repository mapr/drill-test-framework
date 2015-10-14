select d.events events, flatten(d.events) events_flatten from `data.json` d order by d.uid;
