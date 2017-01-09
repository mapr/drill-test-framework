SELECT COUNT(t1.col_int) count_c1, MIN(t2.col_int) min_c2, t2.col_bln
FROM l_tblprtnby_intcl t1, r_tblprtnby_intcl t2
WHERE t1.col_int = t2.col_int OR (t1.col_int IS NULL AND t2.col_int IS NULL)
GROUP BY t2.col_bln, t1.col_int, t2.col_int
ORDER BY t1.col_int, t2.col_int
LIMIT 7
