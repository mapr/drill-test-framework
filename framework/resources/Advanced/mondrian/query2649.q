select customer.city as c0 from customer as customer where (customer.state_province = 'Mexico') and UPPER(customer.city) = UPPER('Mexico City') group by customer.city order by customer.city ASC NULLS LAST;
