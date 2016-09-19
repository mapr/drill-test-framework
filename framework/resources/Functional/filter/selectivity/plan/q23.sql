alter session set `planner.filter.max_selectivity_estimate_factor` = 0.1;
explain plan including all attributes for select * from lineitem l, orders o where l.l_orderkey < 10 and l.orderkey = o.orderkey and o.o_custkey > 200;
alter session set `planner.filter.max_selectivity_estimate_factor` = 1.0;
