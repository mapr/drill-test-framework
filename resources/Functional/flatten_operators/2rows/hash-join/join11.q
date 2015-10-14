select t2.uid, t2.transaction from (select MAX(t1.transaction.amount) max_trans_amount from  
  (select uid, flatten(transactions) transaction from `data.json`) t1) t3 
inner join 
  (select uid, flatten(transactions) transaction from `data.json`) t2 
on t3.max_trans_amount = t2.transaction.amount order by t2.uid limit 1;
