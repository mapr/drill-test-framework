SELECT * 
FROM 
    ( 
        SELECT t1.c4 t1_c4, t2.c4 t2_c4
        FROM `t_alltype.parquet` t1, `t_alltype.parquet` t2   
        WHERE t1.c4 = t2.c4 OR (t1.c4 IS NULL AND t2.c4 IS NULL) 
        ORDER BY t1.c4 nulls last
    ) 
LIMIT 10;
