select
               SUM(
                   CASE    WHEN j2.c_integer IS NULL THEN 0
                           WHEN j2.c_integer >= 0 THEN j2.c_integer*1.2 + 100
                           WHEN j2.c_integer < 0 THEN j2.c_integer
                   END
                   )
from
        j2 FULL OUTER JOIN j1 ON
        (j1.d9 = j2.d9)
           FULL OUTER JOIN j3 ON
        (j1.d9 = j3.d9)
           FULL OUTER JOIN j4 ON
        (j1.d9 = j4.d9)
where
        j1.d9 IS NOT NULL
;
