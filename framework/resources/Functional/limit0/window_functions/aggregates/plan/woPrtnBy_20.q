explain plan for select * from (
SELECT col_tmstmp, COUNT(col_tmstmp) OVER (ORDER by col_tm) count_tmstmp FROM `smlTbl_v`) t limit 0;