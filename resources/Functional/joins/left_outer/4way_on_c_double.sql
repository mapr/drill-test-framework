select DISTINCT
	COALESCE(j1.c_varchar || j2.c_varchar || j3.c_varchar || j4.c_varchar, 'EMPTY') as concatentated_string
from
        j1 LEFT OUTER JOIN j2 ON
        (j1.c_double = j2.c_double)
	   LEFT OUTER JOIN j3 ON
	(j1.c_double = j3.c_double)
	   LEFT OUTER JOIN j4 ON
	(j1.c_double = j4.c_double)
where
	j1.c_double IS NOT NULL
	and  LOWER(COALESCE(j1.c_varchar || j2.c_varchar || j3.c_varchar || j4.c_varchar, 'EMPTY')) <> 'empty'
;
