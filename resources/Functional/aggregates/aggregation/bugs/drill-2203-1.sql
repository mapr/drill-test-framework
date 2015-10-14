select distinct sq.x1, sq.x2, sq.x3 from ( select a1, b1, c1 from t1 union all select a2, b2, c2 from t2 ) as sq(x1,x2,x3) order by 1, 2, 3;
