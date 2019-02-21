set `planner.enable_nljoin_for_scalar_only` = false;
select * from customer cross join orders limit 10;
reset `planner.enable_nljoin_for_scalar_only`;
