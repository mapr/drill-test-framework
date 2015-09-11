-- coalesce with columns from side that does not produce nulls
select 
	count(*),
	coalesce(t1.a1, 100), 
	coalesce(t1.b1, 'zzzzz'), 
	coalesce(t1.c1, date '2015-01-10') 
from 
	t1 left outer join t2 on t1.a1 = t2.a2 
	left outer join t3 on t1.c1 = t3.c3

group by
        coalesce(t1.a1, 100),
        coalesce(t1.b1, 'zzzzz'),
        coalesce(t1.c1, date '2015-01-10')
order by
        coalesce(t1.a1, 100),
        coalesce(t1.b1, 'zzzzz'),
        coalesce(t1.c1, date '2015-01-10')
;

