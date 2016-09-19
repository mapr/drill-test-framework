alter session set `planner.filter.max_selectivity_estimate_factor` = 0.7;
explain plan including all attributes for select l.l_orderkey from lineitem l, orders o where l.l_orderkey < 10 and l.orderkey = o.orderkey and o.o_orderpriority > '5-LOW' group by l.l_orderkey having l.l_orderkey < 50;
alter session set `planner.filter.max_selectivity_estimate_factor` = 1.0;
