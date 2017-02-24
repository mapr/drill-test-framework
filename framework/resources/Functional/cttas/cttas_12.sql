CREATE TEMPORARY TABLE dfs.tmp.temp_tbl_12 PARTITION BY ( col_chr )
AS
SELECT DISTINCT col_chr FROM typeall_l;
SELECT DISTINCT col_chr FROM dfs.tmp.temp_tbl_12;
DROP TABLE dfs.tmp.temp_tbl_12;
