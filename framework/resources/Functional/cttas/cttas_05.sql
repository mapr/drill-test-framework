CREATE TEMPORARY TABLE temp_tbl_05 PARTITION BY( col_dt )
AS
SELECT * FROM typeall_l;
SELECT col_dt FROM dfs.tmp.temp_tbl_05;
DROP TABLE dfs.tmp.temp_tbl_05;
