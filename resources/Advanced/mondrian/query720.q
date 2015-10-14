select customer.state_province as c0 from customer as customer where (customer.country = 'Mexico') group by customer.state_province order by customer.state_province ASC NULLS LAST;
