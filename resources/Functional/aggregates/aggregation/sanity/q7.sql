-- distinct in subquery
select 
	count(distinct a1), 
	sum(a1) 
from 
	(
	select 	distinct 
		a1, 
		b1, 
		c1 
	from 
		t1
	) as sq
group by 
	c1 
order by 
	c1;
