select f.c_custkey, f.c_name, f.o.o_orderkey as o_orderkey, f.o.O_ORDERPRIORITY as O_ORDERPRIORITY from (select c_custkey, c_name,c_acctbal,c_mktsegment, flatten(c_orders) as o from customer) f WHERE f.c_mktsegment like '%AUTOMOBILE%' AND f.c_acctbal between 10 and 1000;
