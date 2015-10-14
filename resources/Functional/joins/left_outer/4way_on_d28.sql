select DISTINCT
	COALESCE(j1.c_varchar || j2.c_varchar || j3.c_varchar || j4.c_varchar, 'EMPTY') as concatentated_string
from
        j1 LEFT OUTER JOIN j2 ON
        (j1.d28 = j2.d28)
	   LEFT OUTER JOIN j3 ON
	(j1.d28 = j3.d28)
	   LEFT OUTER JOIN j4 ON
	(j1.d28 = j4.d28)
where
	j1.d28 IS NOT NULL
	and  LOWER(COALESCE(j1.c_varchar || j2.c_varchar || j3.c_varchar || j4.c_varchar, 'EMPTY')) <> 'empty'
;
