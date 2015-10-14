select t1.uid, t1.event, t2.transaction from  
  (select uid, flatten(events) event from `data.json`) t1 
inner join 
  (select uid, flatten(transactions) transaction from `data.json`) t2 
on t1.uid = t2.uid;
