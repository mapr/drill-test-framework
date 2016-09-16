alter session set `planner.filter.min_selectivity_estimate_factor` = 0.3;
explain plan including all attributes for select * from lineitem l, orders o where l.l_orderkey < 10 and l.l_partkey > 50 and l.l_quantity < 3 and l.l_linenumber < 2 and l.l_returnflag = 'r' and l.orderkey = o.orderkey and o.o_custkey > 200 and o.o_orderpriority < '5-LOW' and o.o_orderstatus = 'F';
alter session set `planner.filter.min_selectivity_estimate_factor` = 0.0;
