-- with sum
explain plan for select * from ( select a1, count(distinct a1), sum(a1) from t1_v group by a1 ) t limit 0;
