SELECT t1.col_bln, t2.col_bln 
FROM l_tblprtnby_blncl t1, r_tblprtnby_blncl t2 
WHERE t1.col_bln = t2.col_bln OR (t1.col_bln IS NULL AND t2.col_bln IS NULL);
