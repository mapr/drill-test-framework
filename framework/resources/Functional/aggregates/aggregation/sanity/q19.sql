-- group by on top of the join
-- grouping columns come from  both tables
-- having clause has multiple conditions

select 
	t2.a2			as col,
	sum(t2.a2)		as sum_on_col,
	count(t2.a2)		as count_on_col,
	sum(t2.a2)/count(t2.a2) as avg_calculated
from
	t1,
	t2
where 
	t1.a1 = t2.a2 and
	t1.b1 = t2.b2 and
	t1.c1 = t2.c2
group by
	t2.a2,
	t1.c1,
	t2.c2
having
	sum(t2.a2)/count(t2.a2) > 5.1 and
	t2.c2 is not null and
	t1.c1 is not null
order by
	1;
	
