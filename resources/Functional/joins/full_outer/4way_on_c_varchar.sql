select
               SUM(
                   CASE    WHEN j2.c_integer IS NULL THEN 0
                           WHEN j2.c_integer >= 0 THEN j2.c_integer*1.2 + 100
                           WHEN j2.c_integer < 0 THEN j2.c_integer
                   END
                   )
from
        j2 FULL OUTER JOIN j1 ON
        (j1.c_varchar = j2.c_varchar)
           FULL OUTER JOIN j3 ON
        (j1.c_varchar = j3.c_varchar)
           FULL OUTER JOIN j4 ON
        (j1.c_varchar = j4.c_varchar)
where
        j1.c_varchar IS NOT NULL
;
