CREATE TEMPORARY TABLE temp_tbl_3wop
AS
SELECT * FROM typeall_l;
SELECT col_vrchr1 FROM temp_tbl_3wop;
DROP TABLE temp_tbl_3wop;
