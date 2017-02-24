CREATE TEMPORARY TABLE temp_tbl_21 AS SELECT col_int, col_chr, col_vrchr1, col_vrchr2, col_bln FROM typeall_l WHERE col_int = 60718;
SELECT * FROM dfs.tmp.temp_tbl_21;
DROP TABLE dfs.tmp.temp_tbl_21;
