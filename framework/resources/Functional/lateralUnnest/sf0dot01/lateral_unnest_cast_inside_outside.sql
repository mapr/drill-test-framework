SELECT customer.c_name, customer.c_address, orders.o_id, orders.o_amount ,cast(customer.c_acctbal as int)
FROM customer, LATERAL
(SELECT O.ord.o_orderkey as o_id, cast(O.ord.o_totalprice as int) as o_amount FROM UNNEST(customer.c_orders) O(ord)) orders order by customer.c_custkey limit 50;
