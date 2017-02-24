CREATE TEMPORARY TABLE temp_tbl_07 PARTITION BY( col_bln )
AS
SELECT DISTINCT col_bln FROM typeall_l;
SELECT col_bln FROM temp_tbl_07;
DROP TABLE temp_tbl_07;
