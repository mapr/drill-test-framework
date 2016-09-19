alter session set `planner.filter.max_selectivity_estimate_factor` = 0.3;
explain plan including all attributes for select * from (select l_partkey, count(*) as cnt, avg(l_partkey) as sum3 from (select l_partkey, l_suppkey, count(*) as cnt2, avg(l_partkey) as sum2 from lineitem where l_partkey > 30 group by l_partkey, l_suppkey) table3 where table3.cnt2 > 5 and table3.sum2 < 10 group by l_partkey) table2 where table2.cnt > 3 and table2.sum3 > 5;
alter session set `planner.filter.max_selectivity_estimate_factor` = 1.0;
