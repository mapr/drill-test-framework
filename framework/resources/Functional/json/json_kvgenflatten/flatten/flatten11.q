create or replace view v1 as 
select userinfo.transaction.trans_id trans_id, max(userinfo.event.event_time) max_event_time
 from (
     select uid, flatten(events) event, flatten(transactions) transaction from `json_kvgenflatten/single-user-transactions.json`
 ) userinfo 
 where userinfo.transaction.trans_time >= userinfo.event.event_time 
 group by userinfo.transaction.trans_id;
 
create or replace view v2 as select uid, flatten(events) event
 from `json_kvgenflatten/single-user-transactions.json`;
 
select v2.uid, v1.trans_id, v2.event.evnt_id
from v1 inner join v2 
on v1.max_event_time = v2.event.event_time;

drop view v2;
drop view v1;
