SELECT t1.col_flt , t2.col_flt 
FROM typeall_l t1 INNER JOIN  typeall_r t2 
ON  CAST(t1.col_flt AS DOUBLE PRECISION) = CAST(t2.col_flt AS DOUBLE PRECISION) OR ( t1.col_flt IS NULL AND t2.col_flt IS NULL );
