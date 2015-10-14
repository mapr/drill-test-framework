select DISTINCT
	COALESCE(j1.c_varchar || j2.c_varchar || j3.c_varchar || j4.c_varchar, 'EMPTY') as concatentated_string
from
        j1 LEFT OUTER JOIN j2 ON
        (j1.d9 = j2.d9)
	   LEFT OUTER JOIN j3 ON
	(j1.d9 = j3.d9)
	   LEFT OUTER JOIN j4 ON
	(j1.d9 = j4.d9)
where
	j1.d9 IS NOT NULL
	and  LOWER(COALESCE(j1.c_varchar || j2.c_varchar || j3.c_varchar || j4.c_varchar, 'EMPTY')) <> 'empty'
;
