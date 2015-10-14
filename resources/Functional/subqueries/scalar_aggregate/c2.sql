-- Correlation to one table outside of the subquery
-- inequality
select
        t1.a1, t1.b1
from
        t1
where
        t1.a1 <> ( select min(t2.a2) from t2 where c2 is not null);
