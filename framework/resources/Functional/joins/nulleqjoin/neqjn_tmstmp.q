SELECT t1.col_tmstmp , t2.col_tmstmp 
FROM typeall_r t1, typeall_l t2 
WHERE t1.col_tmstmp = t2.col_tmstmp OR ( t1.col_tmstmp IS NULL AND t2.col_tmstmp IS NULL );
