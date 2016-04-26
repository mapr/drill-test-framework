explain plan for select * from (
SELECT col_tm, COUNT(col_tm) OVER (ORDER by col_dt) count_tm FROM `smlTbl_v`) t limit 0;