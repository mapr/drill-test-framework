select MAX(t1.c1), t2.c8 
from `t_alltype.parquet` t1, `t_alltype.parquet` t2 
WHERE t1.c4 = t2.c4 OR (t1.c4 IS NULL AND t2.c4 IS NULL) 
GROUP BY t2.c8 
ORDER BY t2.c8;
