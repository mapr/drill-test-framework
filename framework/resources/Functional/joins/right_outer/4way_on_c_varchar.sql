select 
		SUM(
			CASE 	WHEN j1.c_integer IS NULL THEN 0 
				WHEN j1.c_integer >= 0 THEN j2.c_integer*1.2 + 100
				WHEN j1.c_integer < 0 THEN -1
			END
		   )
from
        j2 RIGHT OUTER JOIN j1 ON
        (j1.c_varchar = j2.c_varchar)
	   RIGHT OUTER JOIN j3 ON
	(j1.c_varchar = j3.c_varchar)
	   RIGHT OUTER JOIN j4 ON
	(j1.c_varchar = j4.c_varchar)
where
	j1.c_varchar IS NOT NULL
;
