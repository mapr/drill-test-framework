CREATE TEMPORARY TABLE dfs.tmp.temp_tbl10c PARTITION BY ( col_vrchr1 )
AS
SELECT col_int, col_chr, col_vrchr1, col_vrchr2, col_dt, col_tim, col_tmstmp , col_flt, col_intrvl_yr, col_intrvl_day, col_bln 
FROM typeall_l;
SELECT
        DISTINCT col_vrchr1, 
        MIN(col_vrchr1) min_vrchr1,
        MAX(col_vrchr1) mx_vrchr1,
        COUNT(*) cow_nt
FROM dfs.tmp.temp_tbl10c
GROUP BY col_vrchr1;
DROP TABLE dfs.tmp.temp_tbl10c;
