explain plan for select * from (
SELECT col_int, MIN(col_int) OVER (ORDER by col_int) min_int FROM `smlTbl_v`) t limit 0;