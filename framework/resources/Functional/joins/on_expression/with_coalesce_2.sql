-- COALESCE function's parameter is another column of implicitly convertible type
-- In this case j1.c_bigint column is NULL as well
select count(*), avg(j1.c_integer), avg(j2.c_integer)
from 
	j1 inner join j2
on (COALESCE(j1.c_integer, j1.c_bigint) = j2.c_bigint)
group by
	j1.c_integer,
	j2.c_integer
order by 
	1;
