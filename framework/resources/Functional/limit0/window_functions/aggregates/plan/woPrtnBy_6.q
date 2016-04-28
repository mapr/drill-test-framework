explain plan for select * from (
SELECT col_bgint, MAX(col_bgint) OVER (ORDER by col_tmstmp) max_bgint FROM `smlTbl_v`) t limit 0;