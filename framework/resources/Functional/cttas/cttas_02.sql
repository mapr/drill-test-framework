CREATE TEMPORARY TABLE temp_tbl_02 PARTITION BY ( col_int )
AS
SELECT * FROM typeall_l;
SELECT col_int FROM temp_tbl_02;
DROP TABLE temp_tbl_02;
