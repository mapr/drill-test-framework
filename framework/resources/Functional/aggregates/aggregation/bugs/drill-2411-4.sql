-- Result set is empty: important distinction when you have group by and sum/avg over empty result set with group by
select avg(a1) from t1 where a1 > 11 group by a1;
