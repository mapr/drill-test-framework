select date_sub(max(cast(O_ORDERDate as Date)),min(cast(O_ORDERDate as Date))) as num_days from orders;
