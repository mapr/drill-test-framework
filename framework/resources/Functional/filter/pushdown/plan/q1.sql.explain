-- simple predicate on a groupping column
explain plan for select x, y, z from ( select a1, b1, avg(a1) from t1 group by a1, b1 ) as sq(x, y, z) where x = 10;
