explain plan for select * from (select sum(cast(a1 as int)) from t1 where a1 > 11) t limit 0;
