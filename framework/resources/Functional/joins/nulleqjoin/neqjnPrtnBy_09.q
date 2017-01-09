SELECT t1.col_tim, t2.col_tim
FROM l_tblprtnby_timcl t1, r_tblprtnby_timcl t2 
WHERE t1.col_tim = t2.col_tim OR (t1.col_tim IS NULL AND t2.col_tim IS NULL);
