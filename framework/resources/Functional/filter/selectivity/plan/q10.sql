alter session set `planner.filter.max_selectivity_estimate_factor` = 0.1;
explain plan including all attributes for select * from lineitem where l_orderkey > 10;
alter session set `planner.filter.max_selectivity_estimate_factor` = 1.0;
