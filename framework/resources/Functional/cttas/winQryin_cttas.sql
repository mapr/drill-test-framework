CREATE TEMPORARY TABLE temp_tbl_winqry 
AS
SELECT row_number() over ( partition by col_chr ) row_num , col_chr 
FROM typeall_l;
SELECT * FROM temp_tbl_winqry;
DROP TABLE temp_tbl_winqry;
