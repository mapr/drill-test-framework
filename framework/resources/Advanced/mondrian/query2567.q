select customer.yearly_income as c0 from customer as customer where UPPER(customer.yearly_income) = UPPER('foobar') group by customer.yearly_income order by customer.yearly_income ASC NULLS LAST;
