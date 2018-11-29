set `planner.enable_multiphase_agg` =  false;
set `planner.enable_nljoin_for_scalar_only` = false;
select count(*) from customer c1 cross join customer c2 limit 10;
reset `planner.enable_multiphase_agg`;
reset `planner.enable_nljoin_for_scalar_only`;
