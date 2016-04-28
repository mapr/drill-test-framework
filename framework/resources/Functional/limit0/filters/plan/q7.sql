explain plan for select * from (
select x, y, z from ( select a1, b1, avg(a1) from t1_v t1 group by a1, b1 ) as sq(x, y, z) where (x,y) = (1, 'aaaaa')) t limit 0;
