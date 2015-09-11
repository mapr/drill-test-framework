-- group by 2 columns, count distinct is not on a grouping column
select 
	b1,
	count(distinct a1)	as count_distinct_a1, 
	sum(a1)			as sum_a1, 
	count(b1)		as count_b1,
	count(c1)		as count_c1,
	count(*) 		as count_star
from 	t1 
group by 
	b1, 
	c1 
order by 
	b1;
