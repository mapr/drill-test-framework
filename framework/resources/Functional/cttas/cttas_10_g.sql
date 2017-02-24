CREATE TEMPORARY TABLE dfs.tmp.temp_tbl10g PARTITION BY ( col_bln )
AS
SELECT col_int, col_chr, col_vrchr1, col_vrchr2, col_dt, col_tim, col_tmstmp , col_flt, col_intrvl_yr, col_intrvl_day, col_bln 
FROM typeall_l;
SELECT
        DISTINCT col_bln, 
        COUNT(*) cow_nt
FROM dfs.tmp.temp_tbl10g
GROUP BY col_bln;
DROP TABLE dfs.tmp.temp_tbl10g;
