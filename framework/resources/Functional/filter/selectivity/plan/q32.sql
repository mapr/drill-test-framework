alter session set `planner.filter.max_selectivity_estimate_factor` = 0.01;
explain plan including all attributes for select l.l_orderkey, l.l_linenumber from lineitem l group by l.l_orderkey, l.l_linenumber, l.l_quantity having l.l_orderkey < 50 and l.l_linenumber > 10 and l.l_quantity < 100;
alter session set `planner.filter.max_selectivity_estimate_factor` = 1.0;
