select cast(date_sub(max(cast(O_ORDERDate as Date)), min(cast(O_ORDERDate as Date))) as varchar(10)) as num_days from orders;
