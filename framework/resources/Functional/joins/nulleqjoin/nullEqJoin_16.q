SELECT * 
FROM `t_alltype.parquet` t1 
WHERE EXISTS ( SELECT * FROM `t_alltype.parquet` t2 WHERE t1.c4 = t2.c4 );
