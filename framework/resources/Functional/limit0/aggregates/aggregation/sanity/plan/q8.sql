explain plan for select * from (
-- limit offset in the query
select 
	b1,
	count(distinct a1) 
from 
	t1_v t1 
group by 
	b1 
order by 
	b1 limit 5 offset 1) t limit 0;
