select customer.education as c0 from customer as customer where UPPER(customer.education) = UPPER('8') group by customer.education order by customer.education ASC NULLS LAST;
