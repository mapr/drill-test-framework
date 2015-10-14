-- group by single column, count distinct on aggregation column
select 
	a1,
	count(distinct a1)
from 	
	t1 
group by 
	a1 
order by 
	a1, 
	count(distinct a1) desc;
