SELECT t1.col_int c1, t2.col_int c2 
FROM l_tblprtnby_intcl t1, r_tblprtnby_intcl t2 
WHERE t1.col_int = t2.col_int OR (t1.col_int IS NULL AND t2.col_int IS NULL);
