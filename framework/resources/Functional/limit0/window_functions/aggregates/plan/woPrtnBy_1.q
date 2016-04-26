explain plan for select * from (
SELECT col_int, MAX(col_int) OVER (ORDER by col_int) max_int FROM `smlTbl_v`) t limit 0;