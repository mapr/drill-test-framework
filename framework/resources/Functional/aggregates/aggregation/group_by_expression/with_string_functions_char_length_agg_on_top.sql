-- coalesce with columns from side that does not produce nulls
-- string manipulation functions
-- char_length - not a calcite built in function
select 	sum(x),
	count(distinct y)
from 
	(
	select 
		count(*)								as x,
        	substr(lower(UPPER(to_char(t1.c1, 'MMM-DD-YY'))), 5, 2)			as y,
		char_length(substr(lower(UPPER(to_char(t1.c1, 'MMM-DD-YY'))), 5, 2))	as z
	from 
		t1 left outer join t2 on t1.a1 = t2.a2 
		left outer join t3 on t1.c1 = t3.c3
	group by
        	substr(lower(UPPER(to_char(t1.c1, 'MMM-DD-YY'))), 5, 2),
		char_length(substr(lower(UPPER(to_char(t1.c1, 'MMM-DD-YY'))), 5, 2))
	order by
        	substr(lower(UPPER(to_char(t1.c1, 'MMM-DD-YY'))), 5, 2),
		char_length(substr(lower(UPPER(to_char(t1.c1, 'MMM-DD-YY'))), 5, 2))
	) sq(x,y,z)
group by
	z
;

