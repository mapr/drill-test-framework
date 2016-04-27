explain plan for select * from (
-- Does having expression in the filter prevents filter pushdown ?
select x, y, z from ( select a1, b1, avg(a1) from t1_v t1 group by a1, b1)  as sq(x, y, z) where coalesce(x,100) = 10) t limit 0;
