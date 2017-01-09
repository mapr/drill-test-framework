SELECT t1.col_bln , t2.col_bln 
FROM typeall_l t1 INNER JOIN  typeall_r t2 
ON  t1.col_bln = t2.col_bln OR ( t1.col_bln IS NULL AND t2.col_bln IS NULL );
