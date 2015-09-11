-- left outer join
-- group by on null producing side
-- having clause with the case statement
-- aggregation on top of subquery
-- having clause in the outer query

select 	x3
from
	(
	select 	t2.a2,
		t2.b2,
		count(*) 
	from 
		t1 left outer join t2 on t1.a1 = t2.a2
	group by
		t2.a2,
		t2.b2
	having
		case when t2.a2 is null then 100 else t2.a2 end  > 5
	) as dt(x1, x2, x3)
group by
	x3
having x3 > 1
order by
	x3;
