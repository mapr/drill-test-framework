select
        count(*)
from
        j1 INNER JOIN j2 ON
        (
        j1.d9 = j2.d9
        )
where
        j1.c_bigint IS NOT DISTINCT FROM j2.c_bigint 
	and j1.d9 IS NOT NULL 
;
