select customer.marital_status as c0 from customer as customer where UPPER(customer.marital_status) = UPPER('Bacon') group by customer.marital_status order by customer.marital_status ASC NULLS LAST;
