-- with sum
select a1, count(distinct a1), sum(a1) from t1 group by a1;
