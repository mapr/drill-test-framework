SELECT customer.c_custkey, customer.c_name,orders.o_id, orders.o_amount,orders.O_ORDERPRIORITY
FROM customer, LATERAL
(SELECT O.ord.o_orderkey as o_id, O.ord.o_totalprice as o_amount,O.ord.O_ORDERPRIORITY as O_ORDERPRIORITY FROM UNNEST(customer.c_orders) O(ord) WHERE O.ord.o_totalprice in  (89230.03,270087.44,246408.53,82657.72,153941.38,65277.06,180309.76) AND O.ord.O_ORDERPRIORITY like '%URGENT%' )orders order by customer.c_custkey,orders.o_id, orders.o_amount,orders.O_ORDERPRIORITY limit 50;
