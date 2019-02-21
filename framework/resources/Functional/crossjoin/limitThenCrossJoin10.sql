set `planner.enable_nljoin_for_scalar_only` = false;
select c1.c_custkey,o1.o_orderkey from (select * from customer limit 30) as c1 cross join (select * from orders limit 30) as o1 order by c1.c_custkey,o1.o_orderkey limit 10;
reset `planner.enable_nljoin_for_scalar_only`;
