select date_add(max(O_ORDERDate),date_part('year',min(O_ORDERDate))) as num_days from orders;
