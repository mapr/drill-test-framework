CREATE TEMPORARY TABLE temp_tbl_6wop
AS
SELECT DISTINCT col_chr FROM typeall_l;
SELECT col_chr FROM dfs.tmp.temp_tbl_6wop;
DROP TABLE dfs.tmp.temp_tbl_6wop;
