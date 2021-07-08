SELECT customer.c_custkey, customer.c_name,customer.c_acctbal,orders.o_orderkey, orders.o_totalprice
FROM customer, LATERAL (SELECT O.ord.o_orderkey as o_orderkey, O.ord.o_totalprice as o_totalprice FROM UNNEST(customer.c_orders) O(ord)) orders WHERE customer.c_acctbal between 0 and 9000 order by customer.c_custkey limit 50 ;
