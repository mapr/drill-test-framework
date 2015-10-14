select
               SUM(
                   CASE    WHEN j2.c_integer IS NULL THEN 0
                           WHEN j2.c_integer >= 0 THEN j2.c_integer*1.2 + 100
                           WHEN j2.c_integer < 0 THEN j2.c_integer
                   END
                   )
from
        j2 FULL OUTER JOIN j1 ON
        (j1.d18 = j2.d18)
           FULL OUTER JOIN j3 ON
        (j1.d18 = j3.d18)
           FULL OUTER JOIN j4 ON
        (j1.d18 = j4.d18)
where
        j1.d18 IS NOT NULL
;
