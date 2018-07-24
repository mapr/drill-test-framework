SELECT customer.c_name, orders.c_name FROM customer, LATERAL (SELECT O.o_id, O.o_amount FROM UNNEST(customer.c_orders) O) orders;
