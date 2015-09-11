-- Non correlated 
-- not exists
select 
	a1, b1, c1
from 	t1 
where 
 	not exists (select * from t2 where a2 = 1) order by a1;
