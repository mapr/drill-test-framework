select date_add((max(O_ORDERDate) - min(O_ORDERDate)), date '2000-01-01') as new_date from orders;
