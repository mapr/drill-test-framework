alter session set `planner.filter.max_selectivity_estimate_factor` = 0.3;
explain plan including all attributes for select l.l_linenumber from lineitem l group by l.l_linenumber having l.l_linenumber > 10;
alter session set `planner.filter.max_selectivity_estimate_factor` = 1.0;
