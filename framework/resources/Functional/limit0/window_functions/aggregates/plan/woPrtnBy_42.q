explain plan for select * from (
SELECT RANK () OVER (ORDER by col_int ) rnk FROM `smlTbl_v`) t limit 0;