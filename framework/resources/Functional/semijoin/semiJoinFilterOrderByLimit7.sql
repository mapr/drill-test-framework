set `planner.enable_semijoin` = true;
select orders.o_totalprice from orders where orders.o_custkey in (select customer.c_custkey from customer where c_acctbal > 2500 order by customer.c_mktsegment limit 20) order by orders.o_totalprice limit 10;
reset `planner.enable_semijoin`;
