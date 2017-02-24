CREATE TEMPORARY TABLE dfs.tmp.temp_tbl10e PARTITION BY ( col_dt )
AS
SELECT col_int, col_chr, col_vrchr1, col_vrchr2, col_dt, col_tim, col_tmstmp , col_flt, col_intrvl_yr, col_intrvl_day, col_bln 
FROM typeall_l;
SELECT
        DISTINCT col_dt, 
        MIN(col_dt) min_dt,
        MAX(col_dt) mx_dt,
        COUNT(*) cow_nt
FROM dfs.tmp.temp_tbl10e
GROUP BY col_dt;
DROP TABLE dfs.tmp.temp_tbl10e;
