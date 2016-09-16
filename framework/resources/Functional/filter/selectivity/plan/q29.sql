alter session set `planner.filter.min_selectivity_estimate_factor` = 0.3;
explain plan including all attributes for select l.l_orderkey, l.l_linenumber from lineitem l group by l.l_orderkey, l.l_linenumber, l.l_quantity having l.l_orderkey < 50 and l.l_linenumber > 10 and l.l_quantity < 100;
alter session set `planner.filter.min_selectivity_estimate_factor` = 0.0;
