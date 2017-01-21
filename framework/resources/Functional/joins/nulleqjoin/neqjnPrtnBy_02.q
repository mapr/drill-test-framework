SELECT t1.col_chr c1, t2.col_chr c2 
FROM l_tblprtnby_chrcl t1, r_tblprtnby_chrcl t2 
WHERE t1.col_chr = t2.col_chr OR (t1.col_chr IS NULL AND t2.col_chr IS NULL);
