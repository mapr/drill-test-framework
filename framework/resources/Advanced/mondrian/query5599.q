select customer.gender as c0 from customer as customer where UPPER(customer.gender) = UPPER('FooBar') group by customer.gender order by customer.gender ASC NULLS LAST;
