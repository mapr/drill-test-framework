-- Join on the order by column on one side and group by column on the other side
select 
	cast(sq1.y + sq2.y as double precision) as computed_sum
from
	(
	select 
		c_date,
		c_integer
	from
		j1
	order by 
		c_date
	limit 10
	) as sq1(x, y)
inner join
	(
	select
		c_date,
		avg(c_integer)
	from 
		j3
	group by
		c_date	
	) as sq2(x, y)
on (sq1.x = sq2.x)
;
