-- group by 2 columns
select 
	count(distinct a1), 
	sum(a1), 
	count(b1)
from 
	t1 
group by 
	b1, 
	c1 
order by 
	b1;

