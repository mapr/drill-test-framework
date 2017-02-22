CREATE VIEW v2 AS SELECT * FROM typeall_l;
CREATE TEMPORARY TABLE temp_tbl_v2 PARTITION BY ( col_chr ) AS SELECT * FROM v2;
SELECT col_int, col_chr, col_vrchr1, col_vrchr2, col_dt, col_bln FROM temp_tbl_v2;
DROP TABLE temp_tbl_v2;
DROP VIEW v2;
