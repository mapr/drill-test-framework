-- with avg
select a1, count(distinct a1), avg(a1) from t1_v group by a1;
