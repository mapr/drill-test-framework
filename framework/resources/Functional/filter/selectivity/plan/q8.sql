alter session set `planner.filter.min_selectivity_estimate_factor` = 1.0;
explain plan including all attributes for select * from lineitem where l_orderkey > 10;
alter session set `planner.filter.min_selectivity_estimate_factor` = 0.0;
