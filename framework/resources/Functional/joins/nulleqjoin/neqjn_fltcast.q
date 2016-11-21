SELECT t1.col_flt , t2.col_flt 
FROM typeall_l t1, typeall_r t2 
WHERE cast(t1.col_flt as double) = cast(t2.col_flt as double) OR ( t1.col_flt IS NULL AND t2.col_flt IS NULL );
