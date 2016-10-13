select date_part('day', cast(max(O_ORDERDate) as Date) - cast(min(O_ORDERDate) as Date)) as num_days from orders;
