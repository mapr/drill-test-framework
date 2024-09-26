CREATE TEMPORARY TABLE temp_tbl_5wop
AS
SELECT * FROM typeall_l;
SELECT col_dt FROM dfs.tmp.temp_tbl_5wop;
DROP TABLE dfs.tmp.temp_tbl_5wop;
