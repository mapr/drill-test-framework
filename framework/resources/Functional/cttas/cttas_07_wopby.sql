CREATE TEMPORARY TABLE temp_tbl_7wop
AS
SELECT DISTINCT col_bln FROM typeall_l;
SELECT col_bln FROM temp_tbl_7wop;
DROP TABLE temp_tbl_7wop;
