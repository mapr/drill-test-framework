select count(*) as c0 from (select distinct customer.city as c0, customer.state_province as c1 from customer as customer) as init;
