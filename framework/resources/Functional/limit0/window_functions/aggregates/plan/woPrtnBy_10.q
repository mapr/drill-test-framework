explain plan for select * from (
SELECT col_bgint, COUNT(col_bgint) OVER (ORDER by col_tmstmp) count_bgint FROM `smlTbl_v`) t limit 0;