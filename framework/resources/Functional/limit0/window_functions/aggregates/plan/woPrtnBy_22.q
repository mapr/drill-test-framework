explain plan for select * from (
SELECT col_bgint, MIN(col_bgint) OVER (ORDER by col_bgint) min_bgint FROM `smlTbl_v`) t limit 0;