CREATE TEMPORARY TABLE dfs.tmp.tmp_tbl_4drp AS SELECT * FROM typeall_l;
SELECT COUNT(*) FROM dfs.tmp.tmp_tbl_4drp;
DROP TABLE IF EXISTS dfs.tmp.tmp_tbl_4drp;
