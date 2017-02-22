CREATE TEMPORARY TABLE temp_tbl_01_a 
AS
SELECT * FROM typeall_l WHERE col_vrchr1 IS NOT NULL;
SELECT COUNT(*) FROM temp_tbl_01_a;
DROP TABLE temp_tbl_01_a; 
