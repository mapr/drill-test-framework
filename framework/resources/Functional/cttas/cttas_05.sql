CREATE TEMPORARY TABLE temp_tbl_05 PARTITION BY( col_dt )
AS
SELECT * FROM typeall_l;
SELECT col_dt FROM temp_tbl_05;
DROP TABLE temp_tbl_05;
