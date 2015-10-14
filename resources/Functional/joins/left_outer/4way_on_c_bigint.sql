select DISTINCT
	COALESCE(j1.c_varchar || j2.c_varchar || j3.c_varchar || j4.c_varchar, 'EMPTY') as concatentated_string
from
        j1 LEFT OUTER JOIN j2 ON
        (j1.c_bigint = j2.c_bigint)
	   LEFT OUTER JOIN j3 ON
	(j1.c_bigint = j3.c_bigint)
	   LEFT OUTER JOIN j4 ON
	(j1.c_bigint = j4.c_bigint)
where
	j1.c_bigint IS NOT NULL
	and  LOWER(COALESCE(j1.c_varchar || j2.c_varchar || j3.c_varchar || j4.c_varchar, 'EMPTY')) <> 'empty'
;
