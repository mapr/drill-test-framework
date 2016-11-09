select date_add(date_sub(max(cast(O_ORDERDate as Date)), min(cast(O_ORDERDate as Date))) , date '2000-01-01') as new_date from orders;
