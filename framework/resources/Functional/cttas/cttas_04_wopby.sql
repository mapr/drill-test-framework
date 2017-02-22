CREATE TEMPORARY TABLE temp_tbl_4wop
AS
SELECT * FROM typeall_l;
SELECT col_vrchr2 FROM temp_tbl_4wop;
DROP TABLE temp_tbl_4wop;
