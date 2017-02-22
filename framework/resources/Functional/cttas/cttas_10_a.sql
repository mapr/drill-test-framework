CREATE TEMPORARY TABLE dfs.tmp.temp_tbl10a PARTITION BY ( col_int )
AS
SELECT col_int, col_chr, col_vrchr1, col_vrchr2 ,  col_dt, col_tim, col_tmstmp , col_flt, col_intrvl_yr , col_intrvl_day , col_bln 
FROM typeall_l;
SELECT
        DISTINCT col_int, 
        MAX(col_int) mx_int, 
        MIN(col_int) min_int, 
        SUM(col_int) sum_int, 
        AVG(col_int) avg_int, 
        COUNT(*) cow_nt
FROM dfs.tmp.temp_tbl10a
GROUP BY col_int;
DROP TABLE dfs.tmp.temp_tbl10a;
