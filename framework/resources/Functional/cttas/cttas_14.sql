CREATE TEMPORARY TABLE dfs.tmp.temp_tbl_14 PARTITION BY ( col_chr )
AS
SELECT * FROM typeall_l ORDER BY col_int;
SELECT col_int, col_chr, col_vrchr1, col_dt, col_bln FROM dfs.tmp.temp_tbl_14;
DROP TABLE dfs.tmp.temp_tbl_14;
