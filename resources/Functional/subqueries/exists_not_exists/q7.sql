-- correlated to a single table outside subquery
-- not exists

select 
	distinct b1 
from    
	t1
where 
	not exists 
		(
		select 	* 
		from 
			t2
                where 
			t2.b2 = t1.b1
	       )
order by 1;
