CREATE TEMPORARY TABLE temp_tbl_06 PARTITION BY( col_chr )
AS
SELECT * FROM typeall_l;
SELECT DISTINCT col_chr FROM temp_tbl_06;
DROP TABLE temp_tbl_06;
