-- with avg
explain plan for select * from ( select a1, count(distinct a1), avg(a1) from t1_v group by a1 ) t limit 0;
