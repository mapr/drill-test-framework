select v1.uid, flatten(events), flatten(transactions) from 
    (select uid, events from `json_kvgenflatten/data.json`) v1
inner join
    (select uid, transactions from `json_kvgenflatten/data.json`) v2
on v1.uid = v2.uid;
