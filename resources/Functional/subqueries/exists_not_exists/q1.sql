-- exists
-- Non correlated 
select 
	a1, b1, c1
from 	t1 
where 
 	exists (select * from t2 where a2 = 1) order by a1;
