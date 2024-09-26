CREATE TEMPORARY TABLE temp_tbl_4wop
AS
SELECT * FROM typeall_l;
SELECT col_vrchr2 FROM dfs.tmp.temp_tbl_4wop;
DROP TABLE dfs.tmp.temp_tbl_4wop;
