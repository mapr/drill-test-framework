select date_part('day', max(O_ORDERDate) - min(O_ORDERDate)) as num_days from orders;
