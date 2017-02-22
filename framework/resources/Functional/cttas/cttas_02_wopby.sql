CREATE TEMPORARY TABLE temp_tbl_2wop
AS
SELECT * FROM typeall_l;
SELECT col_int FROM temp_tbl_2wop;
DROP TABLE temp_tbl_2wop;
