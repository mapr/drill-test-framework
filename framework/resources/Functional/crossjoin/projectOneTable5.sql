set `planner.enable_nljoin_for_scalar_only` = false;
select c.c_custkey from customer c cross join orders o order by c.c_custkey limit 10;
reset `planner.enable_nljoin_for_scalar_only`;
