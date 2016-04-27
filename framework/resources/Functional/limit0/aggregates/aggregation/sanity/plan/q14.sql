explain plan for select * from (
-- count distinct on a non grouping column
-- sum in coalesce function
select 
	count(distinct c1), 
	coalesce(sum(a1)+100, sum(a1+1)) 
from 
	t1_v t1 
group by 
	b1 
order by 
	b1) t limit 0;
