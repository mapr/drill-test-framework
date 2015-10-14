-- aggregate in exists subquery
-- with correlation to outer table

select 
	*
from
	t1
where
	exists 
	(
	select 
		count(*),
		a2
	from
		t2
	where	
		a2 = 5
	group by
		a2
	)
order by 
	1
;

