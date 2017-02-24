CREATE TEMPORARY TABLE dfs.tmp.temp_tbl_11 PARTITION BY ( col_int )
AS
SELECT DISTINCT col_int FROM typeall_l ORDER BY col_int;
SELECT * FROM dfs.tmp.temp_tbl_11;
DROP TABLE dfs.tmp.temp_tbl_11;
