SELECT t1.col_vrchr1 , t2.col_vrchr1 FROM 
typeall_l t1 INNER JOIN  typeall_r t2 
ON  t1.col_vrchr1 = t2.col_vrchr1 OR ( t1.col_vrchr1 IS NULL AND t2.col_vrchr1 IS NULL ) 
order by t1.col_vrchr1;
