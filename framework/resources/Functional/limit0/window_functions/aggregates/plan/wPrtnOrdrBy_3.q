explain plan for select * from (
SELECT col_vchar_52, col_int, ROW_NUMBER () OVER (PARTITION BY col_vchar_52 order by col_int) row_numbr FROM `smlTbl_v`) t limit 0;