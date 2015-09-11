-- Left outer join
-- Two subqueries
-- Join column is a "group by column" in both subqueries
-- Join column is the same type

select 
	*
from
	(
	select 
		c_date,
		avg(c_integer)
	from
		j1
	group by
		c_date
	) as sq1(x, y)

left outer join
	(
	select
		c_date,
		avg(c_integer)
	from 
		j3
	group by
		c_date	
	) as sq2(x, y)
on  (sq1.x = sq2.x and sq2.y < 0)
where
	sq2.x is not null
	and sq2.y is not null
;
