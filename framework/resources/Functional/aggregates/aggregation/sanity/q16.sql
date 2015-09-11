select 
	count(distinct t1.a1), 
	count(*) 
from 
	t1 inner join t2 on t1.a1 = t2.a2 
group by 
	t1.b1;
