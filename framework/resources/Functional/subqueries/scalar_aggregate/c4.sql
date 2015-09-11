-- Multiple correlated conditions
select
        t1.a1, t1.b1, t1.c1
from
        t1
where
        t1.a1 <= ( select round(avg(t2.a2)) from t2 where t1.b1 = t2.b2 ) and
        t1.a1 = ( select min(t3.a3) from t3 where t1.b1 = t3.b3 ) and
        t1.c1 <> '2015-01-02'
order by
        1,2,3;
