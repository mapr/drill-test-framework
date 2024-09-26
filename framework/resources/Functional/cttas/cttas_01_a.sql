CREATE TEMPORARY TABLE temp_tbl_01_a 
AS
SELECT * FROM typeall_l WHERE col_vrchr1 IS NOT NULL;
SELECT COUNT(*) FROM dfs.tmp.temp_tbl_01_a;
DROP TABLE dfs.tmp.temp_tbl_01_a;
