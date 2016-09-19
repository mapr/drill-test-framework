alter session set `planner.filter.min_selectivity_estimate_factor` = 0.3;
explain plan including all attributes for select * from lineitem l, orders o where l.l_orderkey < 10 and l.orderkey = o.orderkey and o.o_custkey > 200;
alter session set `planner.filter.min_selectivity_estimate_factor` = 0.0;
