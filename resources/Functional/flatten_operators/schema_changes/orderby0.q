select d.uid, flatten(d.events) from `schema_changes` d order by d.uid;
