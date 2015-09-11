select
               SUM(
                   CASE    WHEN j2.c_integer IS NULL THEN 0
                           WHEN j2.c_integer >= 0 THEN j2.c_integer*1.2 + 100
                           WHEN j2.c_integer < 0 THEN j2.c_integer
                   END
                   )
from
        j2 FULL OUTER JOIN j1 ON
        (j1.c_time = j2.c_time)
           FULL OUTER JOIN j3 ON
        (j1.c_time = j3.c_time)
           FULL OUTER JOIN j4 ON
        (j1.c_time = j4.c_time)
where
        j1.c_time IS NOT NULL
;
