CREATE TEMPORARY TABLE temp_tbl_06 PARTITION BY( col_chr )
AS
SELECT DISTINCT col_chr FROM typeall_l;
SELECT col_chr FROM dfs.tmp.temp_tbl_06;
DROP TABLE dfs.tmp.temp_tbl_06;
