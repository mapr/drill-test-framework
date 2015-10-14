-- Correlation to one table outside of the subquery
-- equality
select 
        t1.a1, t1.b1
from
        t1
where
        t1.a1 = ( select max(t2.a2) from t2 where c2 is not null);
