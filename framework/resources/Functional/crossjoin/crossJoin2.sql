set `planner.enable_nljoin_for_scalar_only` = false;
select * from customer,orders limit 10;
reset `planner.enable_nljoin_for_scalar_only`;
