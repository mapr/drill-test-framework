select userinfo.transaction.trans_id trans_id, max(userinfo.event.event_time) max_event_time
 from (
     select uid, flatten(events) event, flatten(transactions) transaction from `json_kvgenflatten/single-user-transactions.json`
 ) userinfo 
 where userinfo.transaction.trans_time >= userinfo.event.event_time 
 group by userinfo.transaction.trans_id;
