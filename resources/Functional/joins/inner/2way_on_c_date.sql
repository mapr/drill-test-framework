select
        count(*)
from
        j1 INNER JOIN j2 ON
        (
        j1.c_date = j2.c_date
        )
where
        j1.c_bigint IS NOT DISTINCT FROM j2.c_bigint 
	and j1.c_date IS NOT NULL 
;
