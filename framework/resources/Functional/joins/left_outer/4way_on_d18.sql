select DISTINCT
	COALESCE(j1.c_varchar || j2.c_varchar || j3.c_varchar || j4.c_varchar, 'EMPTY') as concatentated_string
from
        j1 LEFT OUTER JOIN j2 ON
        (j1.d18 = j2.d18)
	   LEFT OUTER JOIN j3 ON
	(j1.d18 = j3.d18)
	   LEFT OUTER JOIN j4 ON
	(j1.d18 = j4.d18)
where
	j1.d18 IS NOT NULL
	and  LOWER(COALESCE(j1.c_varchar || j2.c_varchar || j3.c_varchar || j4.c_varchar, 'EMPTY')) <> 'empty'
;
