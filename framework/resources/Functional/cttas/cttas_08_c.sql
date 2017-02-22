CREATE TEMPORARY TABLE temp_tbl8c PARTITION BY ( col_chr, col_bln )
AS
SELECT col_int, col_chr, col_vrchr1, col_vrchr2, col_dt, col_tim, col_tmstmp, col_flt, col_intrvl_yr, col_intrvl_day, col_bln 
FROM typeall_l;
SELECT DISTINCT col_chr FROM temp_tbl8c;
DROP TABLE temp_tbl8c;
