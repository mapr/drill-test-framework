select uid, flatten(events) from `schema_changes` where uid > 1;
