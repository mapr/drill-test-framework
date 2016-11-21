select t1.c1, t2.c2 from `t_alltype.parquet` t1, `t_alltype.parquet` t2 WHERE t1.c1 = t2.c1 AND (t1.c2 = t2.c2 OR (t1.c1 is null and t2.c1 is null) );
