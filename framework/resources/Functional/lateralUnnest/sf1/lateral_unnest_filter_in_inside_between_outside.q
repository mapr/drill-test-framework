SELECT customer.c_custkey, customer.c_name,customer.c_acctbal,orders.o_id, orders.o_amount FROM customer,
LATERAL (SELECT O.ord.o_orderkey as  o_id, O.ord.o_totalprice as o_amount FROM UNNEST(customer.c_orders) O(ord) WHERE O.ord.o_totalprice in (89230.03,270087.44,246408.53,82657.72,153941.38,65277.06,180309.76) )orders WHERE customer.c_acctbal between 0 and 6000 order by customer.c_custkey,customer.c_acctbal,orders.o_id, orders.o_amount limit 50;
