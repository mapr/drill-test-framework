CREATE TEMPORARY TABLE dfs.tmp.temp_tbl_18 PARTITION BY ( col_int )
AS
SELECT col_int, count(*) FROM typeall_l GROUP BY col_int;
SELECT * FROM dfs.tmp.temp_tbl_18;
DROP TABLE dfs.tmp.temp_tbl_18;
