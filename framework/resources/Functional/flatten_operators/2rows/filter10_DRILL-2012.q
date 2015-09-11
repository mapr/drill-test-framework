select d.uid, flatten(events), flatten(transactions) from `data.json` d where d.type='web';
