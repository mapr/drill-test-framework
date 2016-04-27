explain plan for select * from (
SELECT col_tmstmp, MAX(col_tmstmp) OVER (ORDER by col_dt) max_tmstmp FROM `smlTbl_v`) t limit 0;