-- COALESCE function's parameter is numeric literal
select count(*)
from 
	j1
	inner join
	j2
on (COALESCE(j1.c_bigint, -499871720) = j2.c_bigint)
where 
	j1.c_varchar like '%0000%';

