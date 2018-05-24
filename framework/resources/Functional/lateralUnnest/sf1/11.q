SELECT customer.c_name, customer.c_address, orders.o_id, cast(customer.c_accbal as int)
FROM customer, LATERAL 
(SELECT O.o_id, O.o_amount FROM UNNEST(customer.c_orders) O) orders;
