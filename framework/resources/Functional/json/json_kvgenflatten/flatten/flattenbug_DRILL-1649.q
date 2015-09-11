select event_info.uid, transaction_info.trans_id, event_info.event.evnt_id
from (
 select userinfo.transaction.trans_id trans_id, max(userinfo.event.event_time) max_event_time
 from (
     select uid, flatten(events) event, flatten(transactions) transaction from `json_kvgenflatten/single-user-transactions.json`
 ) userinfo
 where userinfo.transaction.trans_time >= userinfo.event.event_time
 group by userinfo.transaction.trans_id
) transaction_info
inner join
(
 select uid, flatten(events) event
 from `json_kvgenflatten/single-user-transactions.json`
) event_info
on transaction_info.max_event_time = event_info.event.event_time;
