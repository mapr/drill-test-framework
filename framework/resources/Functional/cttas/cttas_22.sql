CREATE TEMPORARY TABLE temp_tbl_22 
PARTITION BY ( col_chr ) 
AS
SELECT
        col_chr, 
        MAX(col_int) mx_int,
        MIN(col_int) min_int,
        SUM(col_int) sum_int,
        AVG(col_int) avg_int,
        MIN(col_chr) min_chr,
        MAX(col_chr) mx_chr,
        MIN(col_vrchr1) min_vrcr1,
        MAX(col_vrchr1) mx_vrcr1,
        MIN(col_vrchr2) min_vrcr2,
        MAX(col_vrchr2) mx_vrcr2,
        MAX(col_dt) mx_dt,
        MIN(col_dt) mn_dt,
        MAX(col_tim) mx_tm,
        MIN(col_tim) mn_tm,
        COUNT(*) cow_nt
FROM typeall_l
        GROUP BY col_chr;
SELECT * FROM dfs.tmp.temp_tbl_22;
DROP TABLE temp_tbl_22;
