CREATE TEMPORARY TABLE temp_tbl_6wop
AS
SELECT DISTINCT col_chr FROM typeall_l;
SELECT col_chr FROM temp_tbl_6wop;
DROP TABLE temp_tbl_6wop;
