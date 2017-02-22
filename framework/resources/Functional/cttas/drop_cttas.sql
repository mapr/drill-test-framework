CREATE TEMPORARY TABLE dfs.tmp.tmp_tbl_4drp AS SELECT * FROM typeall_l;
SELECT COUNT(*) FROM tmp_tbl_4drp;
DROP TABLE IF EXISTS tmp_tbl_4drp;
