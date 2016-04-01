explain plan for select * from (
SELECT CUME_DIST () OVER (ORDER by col_tmstmp ) cumeDist FROM `smlTbl_v`) t limit 0;