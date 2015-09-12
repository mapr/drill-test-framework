select customer.city as c0 from customer as customer where (customer.state_province = 'CA') and UPPER(customer.city) = UPPER('Oakland') group by customer.city order by customer.city ASC NULLS LAST;
