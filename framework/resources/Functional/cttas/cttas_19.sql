ALTER SESSION SET `store.format`='json';
CREATE TEMPORARY TABLE dfs.tmp.temp_tbl_19
AS
SELECT * FROM typeall_l;
SELECT COUNT(*) FROM dfs.tmp.temp_tbl_19;
DROP TABLE dfs.tmp.temp_tbl_19;
ALTER SESSION SET `store.format`='parquet';
