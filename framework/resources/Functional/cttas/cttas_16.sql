CREATE TEMPORARY TABLE dfs.tmp.temp_tbl_16 PARTITION BY ( col_vrchr2 )
AS
SELECT * FROM typeall_l;
SELECT col_int, col_chr, col_vrchr1, col_vrchr2, col_dt, col_bln FROM dfs.tmp.temp_tbl_16;
DROP TABLE dfs.tmp.temp_tbl_16;
