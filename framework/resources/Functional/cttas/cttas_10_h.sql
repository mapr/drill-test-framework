CREATE TEMPORARY TABLE dfs.tmp.temp_tbl10h PARTITION BY ( col_tim )
AS
SELECT col_int, col_chr, col_vrchr1, col_vrchr2, col_dt, col_tim, col_tmstmp , col_flt, col_intrvl_yr, col_intrvl_day, col_bln 
FROM typeall_l;
SELECT
        DISTINCT col_tim, 
        MIN(col_tim) min_tim,
        MAX(col_tim) mx_tim,
        COUNT(*) cow_nt
FROM dfs.tmp.temp_tbl10h
GROUP BY col_tim;
DROP TABLE dfs.tmp.temp_tbl10h;
