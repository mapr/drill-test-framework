CREATE TEMPORARY TABLE temp_tbl_winqry 
AS
SELECT row_number() over ( partition by col_chr ) row_num , col_chr 
FROM typeall_l;
SELECT * FROM dfs.tmp.temp_tbl_winqry;
DROP TABLE dfs.tmp.temp_tbl_winqry;
