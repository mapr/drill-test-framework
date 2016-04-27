-- coalesce with columns from null producing side only
explain plan for select * from (
select 
	count(*),
	coalesce(t3.a3, 100), 
	coalesce(t3.b3, 'zzzzz'), 
	coalesce(t3.c3, date '2015-01-10') 
from 
	t1_v t1 left outer join t2_v t2 on t1.a1 = t2.a2 
	left outer join t3_v t3 on t1.c1 = t3.c3

group by
        coalesce(t3.a3, 100),
        coalesce(t3.b3, 'zzzzz'),
        coalesce(t3.c3, date '2015-01-10')
order by
        coalesce(t3.a3, 100),
        coalesce(t3.b3, 'zzzzz'),
        coalesce(t3.c3, date '2015-01-10')
) t limit 0;
