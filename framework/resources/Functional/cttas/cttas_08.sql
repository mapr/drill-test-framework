CREATE TEMPORARY TABLE temp_tbl_08
AS
SELECT col_int, col_chr, col_vrchr1, col_vrchr2, col_dt, col_tim, col_tmstmp, col_flt, col_intrvl_yr, col_intrvl_day, col_bln 
FROM typeall_l;
SELECT COUNT(*) FROM temp_tbl_08;
DROP TABLE temp_tbl_08;
