select d.uid, d.type, flatten(events), flatten(transactions) from `data.json` d where d.type='web';
