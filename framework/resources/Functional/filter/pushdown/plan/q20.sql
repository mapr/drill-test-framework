-- full outer join 
explain plan for select x, y, z from ( select t1.a1, t1.b1, avg(t1.a1) from t1 right outer join t3 on t1.c1 = t3.c3 group by t1.a1, t1.b1 ) as sq(x, y, z) where x=0;
