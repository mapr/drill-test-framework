-- x can be pushed down, but like can not
select x, y, z from ( select t1.a1, max(t1.b1), avg(t1.a1) from t1_v t1, t2_v t2 where t1.c1 = t2.c2 group by t1.a1, t1.b1) as sq(x, y, z) where  y not like '%b%' and x = 10;
