select
               SUM(
                   CASE    WHEN j2.c_integer IS NULL THEN 0
                           WHEN j2.c_integer >= 0 THEN j2.c_integer*1.2 + 100
                           WHEN j2.c_integer < 0 THEN j2.c_integer
                   END
                   )
from
        j2 FULL OUTER JOIN j1 ON
        (j1.d38 = j2.d38)
           FULL OUTER JOIN j3 ON
        (j1.d38 = j3.d38)
           FULL OUTER JOIN j4 ON
        (j1.d38 = j4.d38)
where
        j1.d38 IS NOT NULL
;
