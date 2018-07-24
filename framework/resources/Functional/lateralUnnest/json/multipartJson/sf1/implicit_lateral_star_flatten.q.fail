select * from (select *, flatten(c_orders) as o from customer) f order by f.c_custkey, f.o.o_orderkey, f.o.o_totalprice limit 50;
