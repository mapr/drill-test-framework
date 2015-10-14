-- Join condition is a numeric expresssion
-- Multiple columns
-- Left outer join

select
	count(distinct j1.c_varchar)
from
	j1 LEFT OUTER JOIN j2
	ON  (
	    j1.c_integer + 1 = j2.c_integer
	    AND CAST(j1.c_bigint*1.01 as DOUBLE PRECISION) = j2.c_bigint 
	    AND j2.c_bigint IS NOT NULL 
	    )
;
