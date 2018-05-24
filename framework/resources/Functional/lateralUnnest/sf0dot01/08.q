SELECT customer.c_custkey, customer.c_name,orders.o_id, orders.o_amount ,customer.c_acctbal,customer.c_mktsegment
FROM  customer, LATERAL 
(SELECT O.o_id, O.o_amount FROM UNNEST(customer.c_orders) O) orders WHERE customer.c_acctbal between 10 and 1000 AND customer.c_mktsegment like '%AUTOMOBILE%';
