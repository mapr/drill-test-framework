select date_sub(max(O_ORDERDate),min(O_ORDERDate)) as num_days from orders;
