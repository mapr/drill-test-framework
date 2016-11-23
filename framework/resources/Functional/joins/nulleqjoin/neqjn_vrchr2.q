SELECT t1.col_vrchr2 , t2.col_vrchr2 
FROM typeall_l t1, typeall_r t2 
WHERE t1.col_vrchr2 = t2.col_vrchr2 OR ( t1.col_vrchr2 IS NULL AND t2.col_vrchr2 IS NULL );
