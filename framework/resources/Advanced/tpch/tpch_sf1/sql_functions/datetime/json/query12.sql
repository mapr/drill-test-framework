select date_add(max(cast(O_ORDERDate as Date)),date_part('year',min(cast(O_ORDERDate as Date)))) as num_days from orders;
