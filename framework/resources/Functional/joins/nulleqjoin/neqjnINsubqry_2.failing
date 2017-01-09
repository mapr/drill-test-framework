SELECT t1.c4
FROM `t_alltype.parquet` t1
WHERE NOT EXISTS
            (
                SELECT t2.c4
                FROM `t_alltype.parquet` t2
                WHERE t1.c4 = t2.c4 OR (t1.c4 IS NULL AND t2.c4 IS NULL)
);
