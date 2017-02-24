CREATE TEMPORARY TABLE temp_tbljn as SELECT t1.col_int, t2.col_chr FROM typeall_l t1, typeall_r t2 WHERE t1.col_int = t2.col_int;
SELECT * FROM temp_tbljn;
DROP TABLE temp_tbljn;
