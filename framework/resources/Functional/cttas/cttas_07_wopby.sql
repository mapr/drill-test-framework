CREATE TEMPORARY TABLE temp_tbl_7wop
AS
SELECT DISTINCT col_bln FROM typeall_l;
SELECT col_bln FROM dfs.tmp.temp_tbl_7wop;
DROP TABLE dfs.tmp.temp_tbl_7wop;
