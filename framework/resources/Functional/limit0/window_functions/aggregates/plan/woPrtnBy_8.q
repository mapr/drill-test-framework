explain plan for select * from (
SELECT col_bgint, SUM(col_bgint) OVER (ORDER by col_tmstmp) sum_bgint FROM `smlTbl_v`) t limit 0;