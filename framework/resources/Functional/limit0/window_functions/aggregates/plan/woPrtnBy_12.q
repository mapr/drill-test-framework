explain plan for select * from (
SELECT col_tmstmp, MIN(col_tmstmp) OVER (ORDER by col_dt) min_tmstmp FROM `smlTbl_v`) t limit 0;