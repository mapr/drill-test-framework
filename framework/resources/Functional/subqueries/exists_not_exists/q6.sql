-- correlated to a single table outside subquery
-- exists

select 
	distinct b1 
from    
	t1
where 
	exists (
		select 	* 
		from 
			t2
                where 
			t2.b2 = t1.b1
	       );
