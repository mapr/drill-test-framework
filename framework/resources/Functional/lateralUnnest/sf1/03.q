SELECT customer.c_custkey, customer.c_name,customer.c_acctbal,orders.o_id, orders.o_amount 
FROM customer, LATERAL (SELECT O.o_id, O.o_amount FROM UNNEST(customer.c_orders) O) orders WHERE customer.c_acctbal between 10 and 100 ;
