SELECT customer.c_name, customer.c_address, orders.o_id, cast(customer.c_accbal as int)
FROM customer, LATERAL
(SELECT O.ord.o_orderkey as o_id, O.ord.o_totalprice as o_amount FROM UNNEST(customer.c_orders) O(ord)) orders order by customer.c_custkey limit 50;
