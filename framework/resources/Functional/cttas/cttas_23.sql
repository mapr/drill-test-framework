CREATE TEMPORARY TABLE temp_tbl_23 PARTITION BY ( c1 ) as SELECT * FROM dfs.`Join`.ltbl;
SELECT * FROM dfs.tmp.temp_tbl_23;
DROP TABLE dfs.tmp.temp_tbl_23;
