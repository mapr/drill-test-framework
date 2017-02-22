CREATE TEMPORARY TABLE dfs.tmp.temp_tbl_13 PARTITION BY ( col_chr )
AS
SELECT * FROM typeall_l ORDER BY col_int LIMIT 1;
SELECT COUNT(*) FROM dfs.tmp.temp_tbl_13;
DROP TABLE dfs.tmp.temp_tbl_13;
