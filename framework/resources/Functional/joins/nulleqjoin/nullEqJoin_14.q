SELECT * 
FROM 
    (select c4 from `t_alltype.parquet` where c4 LIKE '%c%' ) t1, 
    (select c4 from `t_alltype.parquet` where c4 LIKE '%c%' ) t2 
WHERE ((t1.c4 IS NULL AND t2.c4 IS NULL) OR t1.c4 = t2.c4 );
