set `planner.enable_nljoin_for_scalar_only` = false;
select b.o_totalprice,d.c_custkey from (select orders.o_totalprice from orders where cast(orders.o_custkey as int) in (select cast(customer.c_custkey as int) from customer) order by orders.o_totalprice limit 10) as b cross join customer d order by b.o_totalprice,d.c_custkey limit 10;
reset `planner.enable_nljoin_for_scalar_only`;
