select d.uid, flatten(d.events) from `data.json` d order by d.uid;
