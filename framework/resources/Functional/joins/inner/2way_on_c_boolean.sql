select
        count(*)
from
        j1 INNER JOIN j2 ON
        (
        j1.c_boolean = j2.c_boolean
        )
where
        j1.c_bigint IS NOT DISTINCT FROM j2.c_bigint 
	and j1.c_boolean IS NOT NULL 
;
