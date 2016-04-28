explain plan for select * from (
SELECT RANK () OVER (ORDER by col_tmstmp ) rnk FROM `smlTbl_v`) t limit 0;