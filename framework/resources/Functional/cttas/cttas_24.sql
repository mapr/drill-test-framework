use dfs.drillTestDir;
CREATE TEMPORARY TABLE temp_tbl_24 AS SELECT * FROM dfs.`Join`.ltbl;
SELECT count(*) FROM dfs.tmp.temp_tbl_24;
DROP TABLE dfs.tmp.temp_tbl_24;
