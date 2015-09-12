select customer.city as c0 from customer as customer where (customer.state_province = 'BC') and UPPER(customer.city) = UPPER('Oak Bay') group by customer.city order by customer.city ASC NULLS LAST;
