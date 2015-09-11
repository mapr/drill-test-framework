-- Correlation to one table outside of the subquery
-- Non correlated 'not in'
-- Non correlated 'in'
select
        t1.a1, t1.b1
from
        t1
where
        t1.a1 >= ( select max(t2.a2) from t2 where t2.c2 = t1.c1) and
        t1.c1 not in (select min(c3) from t3) and
        t1.b1 in (select b3 from t3) ;
