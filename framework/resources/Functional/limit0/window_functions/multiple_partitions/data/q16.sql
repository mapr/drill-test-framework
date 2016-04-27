select
	sum(c_integer) over(),
	sum(c_integer) over(partition by c_date),
	c_integer,
	c_date
from
	j7_v
order by
        sum(c_integer) over(),
        sum(c_integer) over(partition by c_date)
;
