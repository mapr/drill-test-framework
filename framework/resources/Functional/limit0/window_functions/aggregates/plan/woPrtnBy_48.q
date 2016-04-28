explain plan for select * from (
SELECT DENSE_RANK () OVER (ORDER by col_bgint ) dense_rnk FROM `smlTbl_v`) t limit 0;