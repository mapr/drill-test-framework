select customer.c_custkey, customer.c_name, t.o.o_orderkey, t.o.o_totalprice from customer , unnest(customer.c_orders) t(o) order by customer.c_custkey, t.o.o_orderkey, t.o.o_totalprice limit 50;
