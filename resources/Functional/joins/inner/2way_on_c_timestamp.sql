select
        count(*)
from
        j1 INNER JOIN j2 ON
        (
        j1.c_timestamp = j2.c_timestamp
        )
where
        j1.c_bigint IS NOT DISTINCT FROM j2.c_bigint 
	and j1.c_timestamp IS NOT NULL 
;
