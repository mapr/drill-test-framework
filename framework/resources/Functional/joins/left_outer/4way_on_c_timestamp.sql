select DISTINCT
	COALESCE(j1.c_varchar || j2.c_varchar || j3.c_varchar || j4.c_varchar, 'EMPTY') as concatentated_string
from
        j1 LEFT OUTER JOIN j2 ON
        (j1.c_timestamp = j2.c_timestamp)
	   LEFT OUTER JOIN j3 ON
	(j1.c_timestamp = j3.c_timestamp)
	   LEFT OUTER JOIN j4 ON
	(j1.c_timestamp = j4.c_timestamp)
where
	j1.c_timestamp IS NOT NULL
	and  LOWER(COALESCE(j1.c_varchar || j2.c_varchar || j3.c_varchar || j4.c_varchar, 'EMPTY')) <> 'empty'
;
