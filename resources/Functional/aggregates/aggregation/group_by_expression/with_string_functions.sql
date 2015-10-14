-- coalesce with columns from side that does not produce nulls
-- mix case (drill-2168)
select 
	count(*),
        substr(lower(UPPER(to_char(t1.c1, 'MMM-DD-YY'))), 5, 2)
from 
	t1 left outer join t2 on t1.a1 = t2.a2 
	left outer join t3 on t1.c1 = t3.c3

group by
        substr(LOWER(upper(to_char(t1.c1, 'MMM-DD-YY'))), 5, 2)
order by
        substr(lower(upper(to_char(t1.c1, 'MMM-DD-YY'))), 5, 2)
;

