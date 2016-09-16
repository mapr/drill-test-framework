alter session set `planner.filter.max_selectivity_estimate_factor` = 0.3;
explain plan including all attributes for select * from (select l_partkey, l_suppkey, count(*) as cnt from lineitem where l_suppkey > 20 group by l_partkey, l_suppkey) table2 where table2.cnt > 3;
alter session set `planner.filter.max_selectivity_estimate_factor` = 1.0;
