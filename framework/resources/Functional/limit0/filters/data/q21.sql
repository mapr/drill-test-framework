-- with simple constant folding
select x, y, z from ( select t1.a1, t1.b1, avg(t1.a1) from t1_v t1, t2_v t2 where t1.c1 = t2.c2 group by t1.a1, t1.b1 ) as sq(x, y, z) where x = 10+10+10 or x=10+10+10+10 or x=1+1+1+1+1;
