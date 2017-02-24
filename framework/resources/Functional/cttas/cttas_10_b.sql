CREATE TEMPORARY TABLE dfs.tmp.temp_tbl10b PARTITION BY ( col_chr )
AS
SELECT col_int, col_chr, col_vrchr1, col_vrchr2 ,  col_dt, col_tim, col_tmstmp , col_flt, col_intrvl_yr , col_intrvl_day , col_bln 
FROM typeall_l;
SELECT
        DISTINCT col_chr, 
        MIN(col_chr) min_chr,
        MAX(col_chr) mx_chr,
        COUNT(*) cow_nt
FROM dfs.tmp.temp_tbl10b
GROUP BY col_chr;
DROP TABLE dfs.tmp.temp_tbl10b;
