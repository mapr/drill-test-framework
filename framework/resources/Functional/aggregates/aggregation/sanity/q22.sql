-- right outer join
-- grouping columns come from  both tables
-- having clause with between

select 
	t3.a3			as col,
	sum(t3.a3)		as sum_on_col,
	count(t3.a3)		as count_on_col,
	sum(t3.a3)/count(t3.a3) as avg_calculated
from
	t1 right outer join t3
on 
	t1.a1 = t3.a3 
group by
	t3.a3,
	t1.c1,
	t3.c3
having
	sum(t3.a3)/count(t3.a3)  between 1 and 3
order by
	2 desc;
