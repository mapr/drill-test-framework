select customer.city as c0 from customer as customer where UPPER(customer.city) = UPPER('Redwood City') group by customer.city order by customer.city ASC NULLS LAST;
