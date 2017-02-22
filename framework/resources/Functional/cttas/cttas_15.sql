CREATE TEMPORARY TABLE dfs.tmp.temp_tbl_15 PARTITION BY ( col_vrchr1 )
AS
SELECT * FROM typeall_l ORDER BY col_int;
SELECT col_int, col_chr, col_vrchr1, col_vrchr2, col_dt, col_bln FROM dfs.tmp.temp_tbl_15;
DROP TABLE dfs.tmp.temp_tbl_15;
