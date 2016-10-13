select cast((max(O_ORDERDate) - min(O_ORDERDate)) as varchar(10)) as num_days from orders;
