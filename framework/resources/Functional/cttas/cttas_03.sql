CREATE TEMPORARY TABLE temp_tbl_03 PARTITION BY( col_vrchr1 )
AS
SELECT * FROM typeall_l;
SELECT col_vrchr1 FROM temp_tbl_03;
DROP TABLE temp_tbl_03;
