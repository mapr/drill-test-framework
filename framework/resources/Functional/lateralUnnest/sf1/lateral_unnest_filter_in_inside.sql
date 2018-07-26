SELECT  customer.c_custkey,customer.c_name,orders.o_orderkey, orders.o_totalprice
FROM customer, LATERAL (SELECT O.ord.o_orderkey as o_orderkey, O.ord.o_totalprice as o_totalprice FROM UNNEST(customer.c_orders) O(ord) WHERE O.ord.o_totalprice in (89230.03,270087.44,246408.53,82657.72,153941.38,65277.06,180309.76) )orders order by customer.c_custkey,orders.o_orderkey, orders.o_totalprice limit 50;
