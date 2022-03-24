select * from 
( 
    select t1.c4, t2.c4 as col2
    from `t_alltype.parquet` t1, `t_alltype.parquet` t2 
    WHERE t1.c4 = t2.c4 or (t1.c4 IS NULL AND t2.c4 IS NULL) ORDER BY t1.c4 NULLS LAST
);
