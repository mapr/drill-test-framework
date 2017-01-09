SELECT t1.col_chr , t2.col_chr 
FROM typeall_l t1 INNER JOIN  typeall_r t2 
ON t1.col_chr = t2.col_chr OR ( t1.col_chr IS NULL AND t2.col_chr IS NULL );
