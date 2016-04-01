explain plan for select * from (
select x, y, z from ( select a1, b1, avg(a1) from t1_v t1 group by a1, b1 ) as sq(x, y, z) where x in (1,2,3)) t limit 0;
