CREATE TEMPORARY TABLE temp_tbl_5wop
AS
SELECT * FROM typeall_l;
SELECT col_dt FROM temp_tbl_5wop;
DROP TABLE temp_tbl_5wop;
