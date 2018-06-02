select f.c_name,f.c_address, f.o.o_orderkey as o_orderkey, cast(f.c_accbal as int) from (select c_custkey, c_name,c_accbal,c_address,flatten(c_orders) as o from customer) f;
