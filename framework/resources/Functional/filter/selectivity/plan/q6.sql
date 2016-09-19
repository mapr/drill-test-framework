alter session set `planner.filter.min_selectivity_estimate_factor` = 0.3;
explain plan including all attributes for select * from lineitem where l_orderkey < 10 and l_partkey < 50;
alter session set `planner.filter.min_selectivity_estimate_factor` = 0.0;
