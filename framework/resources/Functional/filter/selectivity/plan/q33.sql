alter session set `planner.filter.min_selectivity_estimate_factor` = 0.1;
explain plan including all attributes for select l.l_orderkey from lineitem l, orders o where l.l_orderkey < 10 and l.orderkey = o.orderkey and o.o_custkey > 200 group by l.l_orderkey having l.l_orderkey < 50;
alter session set `planner.filter.min_selectivity_estimate_factor` = 0.0;
