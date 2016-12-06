SELECT t1.col_dt c1, t2.col_dt c2 
FROM l_tblprtnby_dtcl t1, r_tblprtnby_dtcl t2 
WHERE t1.col_dt = t2.col_dt OR (t1.col_dt IS NULL AND t2.col_dt IS NULL);
