CREATE TEMPORARY TABLE dfs.tmp.temp_tbl10i PARTITION BY ( col_intrvl_day )
AS
SELECT col_int, col_chr, col_vrchr1, col_vrchr2, col_dt, col_tim, col_tmstmp , col_flt, col_intrvl_yr, col_intrvl_day, col_bln 
FROM typeall_l;
SELECT
        DISTINCT col_tim, 
        MIN(col_tim) min_tm,
        MAX(col_tim) mx_tm,
        COUNT(*) cow_nt
FROM dfs.tmp.temp_tbl10i
GROUP BY col_tim;
DROP TABLE dfs.tmp.temp_tbl10i;
