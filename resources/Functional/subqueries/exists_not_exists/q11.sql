select 
	a1 
from 
	t1 
where 
	exists 
	( 
	select 
		* 
	from 
		t2 
	where 
		t1.b1 = t2.b2 and 
		t1.a1-1 > t2.a2
	) 
order by 
	a1;
