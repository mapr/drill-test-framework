CREATE TEMPORARY TABLE temp_tbl_in
AS 
SELECT col_int, col_chr, col_vrchr1, col_vrchr2, col_dt, col_bln
FROM typeall_l WHERE col_chr IN ('WV','OR','VA','MA','OK','IN','SC','PA','LA') AND col_int >= 39893;
SELECT * FROM temp_tbl_in;
DROP TABLE temp_tbl_in;
