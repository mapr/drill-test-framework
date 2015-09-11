-- count distinct with sum on non aggregate column
-- drill - 2092
select 
	count(distinct a1), 
	sum(a1) 
from 
	t1 
group by 
	c1 
order by 
	c1;
