set `planner.enable_semijoin` = true;
select orders.o_totalprice from orders where (orders.o_custkey,orders.o_totalprice) in (select customer.c_custkey,customer.c_acctbal from customer)  order by orders.o_totalprice limit 10;
reset `planner.enable_semijoin`;
