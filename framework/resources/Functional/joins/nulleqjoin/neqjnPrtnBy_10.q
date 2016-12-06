SELECT t1.col_tmstmp, t2.col_tmstmp 
FROM l_tblprtnby_tmstmpcl t1, r_tblprtnby_tmstmpcl t2 
WHERE t1.col_tmstmp = t2.col_tmstmp OR (t1.col_tmstmp IS NULL AND t2.col_tmstmp IS NULL);
