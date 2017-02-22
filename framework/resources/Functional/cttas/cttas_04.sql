CREATE TEMPORARY TABLE temp_tbl_04 PARTITION BY( col_vrchr2 )
AS
SELECT * FROM typeall_l;
SELECT col_vrchr2 FROM temp_tbl_04;
DROP TABLE temp_tbl_04;
