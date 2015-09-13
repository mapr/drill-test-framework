select customer.city as c0 from customer as customer where (customer.state_province = 'WA') and UPPER(customer.city) = UPPER('Lynnwood') group by customer.city order by customer.city ASC NULLS LAST;
