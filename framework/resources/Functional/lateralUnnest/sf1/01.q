SELECT * FROM customer,LATERAL (SELECT * FROM UNNEST(customer.c_orders));
