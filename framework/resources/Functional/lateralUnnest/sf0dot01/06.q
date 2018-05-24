SELECT customer.c_custkey, customer.c_name,orders.o_id, orders.o_amount,ORDERS.O_ORDERPRIORITY
FROM customer, LATERAL
(SELECT O.o_id, O.o_amount FROM UNNEST(customer.c_orders) O WHERE O.O_ORDERPRIORITY like '%URGENT%' )orders;
