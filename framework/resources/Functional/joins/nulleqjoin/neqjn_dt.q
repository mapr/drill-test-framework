SELECT t1.col_dt , t2.col_dt 
FROM typeall_l t1, typeall_r t2 
WHERE t1.col_dt = t2.col_dt OR ( t1.col_dt IS NULL AND t2.col_dt IS NULL ) 
order by t1.col_dt;
