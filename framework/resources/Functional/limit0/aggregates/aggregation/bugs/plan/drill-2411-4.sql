-- Result set is empty: important distinction when you have group by and sum/avg over empty result set with group by
explain plan for select * from (select avg(cast(a1 as int)) from t1 where a1 > 11 group by a1) t limit 0;
