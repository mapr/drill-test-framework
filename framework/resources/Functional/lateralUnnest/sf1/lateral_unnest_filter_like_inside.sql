SELECT customer.c_custkey, customer.c_name,orders.o_id, orders.o_amount,ORDERS.O_ORDERPRIORITY
FROM customer, LATERAL
(SELECT O.ord.o_orderkey as o_id, O.ord.o_totalprice as o_amount, o.ord.o_orderpriority as o_orderpriority FROM UNNEST(customer.c_orders) O(ord) WHERE O.ord.O_ORDERPRIORITY like '%URGENT%' )orders order by customer.c_custkey limit 50;
