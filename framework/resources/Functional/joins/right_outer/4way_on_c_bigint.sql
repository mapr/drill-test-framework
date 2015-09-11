select 
		SUM(
			CASE 	WHEN j1.c_integer IS NULL THEN 0 
				WHEN j1.c_integer >= 0 THEN j2.c_integer*1.2 + 100
				WHEN j1.c_integer < 0 THEN -1
			END
		   )
from
        j2 RIGHT OUTER JOIN j1 ON
        (j1.c_bigint = j2.c_bigint)
	   RIGHT OUTER JOIN j3 ON
	(j1.c_bigint = j3.c_bigint)
	   RIGHT OUTER JOIN j4 ON
	(j1.c_bigint = j4.c_bigint)
where
	j1.c_bigint IS NOT NULL
;
