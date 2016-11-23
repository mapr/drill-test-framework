SELECT *
FROM
    (
        select * from `t_alltype.parquet` t1, `t_alltype.parquet` t2 
        WHERE ( 
                  t1.c4 = t2.c4 
                  OR (t1.c4 IS NULL AND t2.c4 IS NULL) 
              ) 
        AND EXISTS (
                       select c4 
                       from `t_alltype.parquet` 
                       where c4 NOT LIKE 'c%' AND c4 NOT LIKE 'a%' AND c4 NOT LIKE 'm%' AND c4 NOT LIKE 'e%'
                   )
        ORDER BY t1.c1
        LIMIT 50      
);
