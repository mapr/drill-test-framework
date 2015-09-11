select DISTINCT
	COALESCE(j1.c_varchar || j2.c_varchar || j3.c_varchar || j4.c_varchar, 'EMPTY') as concatentated_string
from
        j1 LEFT OUTER JOIN j2 ON
        (j1.c_float = j2.c_float)
	   LEFT OUTER JOIN j3 ON
	(j1.c_float = j3.c_float)
	   LEFT OUTER JOIN j4 ON
	(j1.c_float = j4.c_float)
where
	j1.c_float IS NOT NULL
	and  LOWER(COALESCE(j1.c_varchar || j2.c_varchar || j3.c_varchar || j4.c_varchar, 'EMPTY')) <> 'empty'
;
