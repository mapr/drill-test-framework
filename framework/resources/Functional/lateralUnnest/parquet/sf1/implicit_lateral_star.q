select * from customer , unnest(customer.c_orders) t(o) order by customer.c_custkey, t.o.o_orderkey, t.o.o_totalprice limit 50;
