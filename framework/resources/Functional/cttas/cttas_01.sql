CREATE TEMPORARY TABLE temp_tbl_01 
AS
SELECT * FROM typeall_l;
SELECT COUNT(*) FROM dfs.tmp.temp_tbl_01;
DROP TABLE dfs.tmp.temp_tbl_01;
