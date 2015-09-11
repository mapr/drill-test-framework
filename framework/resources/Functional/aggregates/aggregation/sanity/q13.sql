-- multiple count distinct on different columns
select 
	count(distinct a1), 
	count(distinct b1),
	count(distinct c1) 
from 
	t1 
group by 
	c1 
order by 
	1,
	2,
	3;
