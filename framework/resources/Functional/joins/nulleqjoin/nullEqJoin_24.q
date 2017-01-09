select DISTINCT t1.col_int
FROM typeall_l t1, typeall_r t2
WHERE t1.col_int = t2.col_int OR (t1.col_int IS NULL AND t2.col_int IS NULL);
