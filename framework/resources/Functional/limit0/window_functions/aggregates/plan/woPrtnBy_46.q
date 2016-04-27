explain plan for select * from (
SELECT ROW_NUMBER () OVER (ORDER by col_bgint) row_numbr FROM `smlTbl_v`) t limit 0;