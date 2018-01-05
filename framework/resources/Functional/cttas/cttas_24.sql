use dfs_test.drillTestDir;
CREATE TEMPORARY TABLE temp_tbl_24 AS SELECT * FROM dfs_test.`Join`.ltbl;
SELECT count(*) FROM dfs.tmp.temp_tbl_24;
DROP TABLE dfs.tmp.temp_tbl_24;
