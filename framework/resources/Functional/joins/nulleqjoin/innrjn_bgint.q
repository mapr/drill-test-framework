SELECT t1.col_bigint , t2.col_bigint 
FROM tbl_bigint_l t1 INNER JOIN tbl_bigint_r t2 
ON t1.col_bigint = t2.col_bigint OR ( t1.col_bigint IS NULL AND t2.col_bigint IS NULL );
