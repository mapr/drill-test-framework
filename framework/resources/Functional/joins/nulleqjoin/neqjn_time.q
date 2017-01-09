SELECT t1.col_tim , t2.col_tim 
FROM typeall_l t1, typeall_r t2 
WHERE t1.col_tim = t2.col_tim OR ( t1.col_tim IS NULL AND t2.col_tim IS NULL ) 
order by t1.col_tim nulls last;
