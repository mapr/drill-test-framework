-- Does having expression in the filter prevents filter pushdown ?
explain plan for select x, y, z from ( select b1, c1, avg(a1) from t1 group by b1, c1 ) as sq(x, y, z) where y = '2015-01-01';
