select d.uid, d.type, flatten(events), flatten(transactions) from `schema_changes` d where d.type='web';
