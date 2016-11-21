SELECT t1.col_int , t2.col_int 
FROM tbl_bigint_l t1 FULL OUTER JOIN tbl_bigint_r t2 
ON t1.col_int = t2.col_int OR ( t1.col_int IS NULL AND t2.col_int IS NULL );
