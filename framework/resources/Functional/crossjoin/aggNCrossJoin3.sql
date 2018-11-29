set `planner.enable_nljoin_for_scalar_only` = false;
select * from (select count(*) from customer) as c1,(select count(*) from orders) as o1;
reset `planner.enable_nljoin_for_scalar_only`;
