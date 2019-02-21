set `planner.enable_multiphase_agg` =  false;
set `planner.enable_nljoin_for_scalar_only` = false;
SELECT MAX(a.c_acctbal*b.o_totalprice) FROM customer a CROSS JOIN orders b limit 10;
reset `planner.enable_multiphase_agg`;
reset `planner.enable_nljoin_for_scalar_only`;
