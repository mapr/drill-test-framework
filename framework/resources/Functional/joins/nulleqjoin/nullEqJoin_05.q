SELECT *
FROM 
    (
        select t1.c4 from `t_alltype.parquet` t1, `t_alltype.parquet` t2 
        WHERE t1.c4 = t2.c4 OR (t1.c4 IS NULL AND t2.c4 IS NULL)
        ORDER BY t1.c4
        LIMIT 0
    );
