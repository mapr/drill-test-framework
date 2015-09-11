-- scalar aggregate in not exists returns NULL value
-- with correlation to outer table

select 
	*
from
	t1
where
	not exists 
	(
	select 
		max(a2)+100
	from
		t2
	where	
		a2 > 10000
	)
order by 
	1
;

