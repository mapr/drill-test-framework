CREATE TEMPORARY TABLE dfs.tmp.temp_tbl10d PARTITION BY ( col_vrchr2 )
AS
SELECT col_int, col_chr, col_vrchr1, col_vrchr2, col_dt, col_tim, col_tmstmp , col_flt, col_intrvl_yr, col_intrvl_day, col_bln 
FROM typeall_l;
SELECT
        DISTINCT col_vrchr2, 
        MIN(col_vrchr2) min_vrchr2,
        MAX(col_vrchr2) mx_vrchr2,
        COUNT(*) cow_nt
FROM dfs.tmp.temp_tbl10d
GROUP BY col_vrchr2;
DROP TABLE dfs.tmp.temp_tbl10d;
