explain plan for select * from (
-- subquery in from clause, group by aggregate function
select 
	count(distinct a1), 
	sum(a1) 
from 
	(
	select 
		a1, 
		b1, 
		c1 
	from 	t1_v t1
	) as sq
group by 
	b1 
order by 
	b1,
	sum(a1)) t limit 0;
