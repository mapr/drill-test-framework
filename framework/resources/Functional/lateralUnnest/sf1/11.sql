select f.c_name,f.c_address, f.o.o_orderkey as o_orderkey, cast(f.c_accbal as int) from (select c_custkey, c_name,c_address,c_accbal, flatten(c_orders) as o from customer) f;
