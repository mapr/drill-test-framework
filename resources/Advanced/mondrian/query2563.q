select customer.country as c0 from customer as customer where UPPER(customer.country) = UPPER('foobar') group by customer.country order by customer.country ASC NULLS LAST;
