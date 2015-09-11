-- right outer join
-- group by on top of the join
-- grouping columns come from both tables
-- multiple conditions in the having clause 

select 	
        dt.x1,
        sum(dt.x1)*1.08 as sum_dt_x1,
        dt.x2,
        dt.x3,
        dt.x4
from
	(
	select 
		t3.a3			as col,
		sum(t3.a3)		as sum_on_col,
		count(t3.a3)		as count_on_col,
		sum(t3.a3)/count(t3.a3) as avg_calculated
	from
		t3 right outer join t1
	on 
		t1.a1 = t3.a3 
	group by
		t3.a3,
		t1.c1,
		t3.c3
	order by
		1,
		2,
		3,
		4 desc
	) dt(x1, x2, x3, x4)
group by
	dt.x1,
	dt.x2,
	dt.x3,
	dt.x4
having
	dt.x1 between 0 and 10000
	and dt.x2 not in (100, 200, 300, 400, 500, 600, 700, 800, 900, 1000)
	and dt.x4 is not null
	and sum(case when dt.x1 is null then 0 else dt.x1 end) > 0.0
order by
	2 desc;
