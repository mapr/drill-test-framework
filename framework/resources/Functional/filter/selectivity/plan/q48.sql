alter session set `planner.filter.min_selectivity_estimate_factor` = 0.3;
explain plan including all attributes for select * from (select l_partkey, l_suppkey, count(*) as cnt, avg(l_partkey) as sum3 from lineitem where l_suppkey > 20 group by l_partkey, l_suppkey) table2 where table2.cnt > 3 and table2.sum3 > 5;
alter session set `planner.filter.min_selectivity_estimate_factor` = 0.0;
