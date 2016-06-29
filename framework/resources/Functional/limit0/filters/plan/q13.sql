explain plan for select * from (
-- Does having expression in the filter prevents filter pushdown ?
select x, y, z from ( select a1, b1, avg(a1) from t1_v t1 group by a1, b1 ) as sq(x, y, z) where cast(x as varchar(10)) = y) t limit 0;
