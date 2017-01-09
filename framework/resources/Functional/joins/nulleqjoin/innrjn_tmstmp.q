SELECT t1.col_tmstmp , t2.col_tmstmp 
FROM typeall_l t1 INNER JOIN  typeall_r t2 
ON  t1.col_tmstmp = t2.col_tmstmp OR ( t1.col_tmstmp IS NULL AND t2.col_tmstmp IS NULL );
