CREATE TEMPORARY TABLE temp_tbl_2wop
AS
SELECT * FROM typeall_l;
SELECT col_int FROM dfs.tmp.temp_tbl_2wop;
DROP TABLE dfs.tmp.temp_tbl_2wop;
