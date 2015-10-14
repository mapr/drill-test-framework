-- count distinct on a non grouping column
select 	b1, 
	count(distinct a1) 
from 	
	t1 
group by 
	b1 
order by 
	b1;
