SELECT customer.c_custkey, customer.c_name,orders.o_id, orders.o_amount ,customer.c_acctbal,customer.c_mktsegment
FROM  customer, LATERAL
(SELECT O.ord.o_orderkey as o_id, O.ord.o_totalprice as o_amount FROM UNNEST(customer.c_orders) O(ord)) orders WHERE customer.c_acctbal between 0 and 9000 AND customer.c_mktsegment like '%AUTOMOBILE%' order by customer.c_custkey limit 50;
