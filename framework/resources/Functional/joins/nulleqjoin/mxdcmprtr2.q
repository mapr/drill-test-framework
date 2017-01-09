SELECT * 
FROM tbl_bigint_l t1, tbl_bigint_r t2 
WHERE  t1.col_bigint = t2.col_bigint 
AND (
      (t1.col_int=t2.col_int) 
    OR 
      (t1.col_int IS NULL AND t2.col_int IS NULL)
    );
