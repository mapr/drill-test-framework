explain plan for select * from (
SELECT col_vchar_52, col_int, RANK () OVER (PARTITION BY col_vchar_52 order by col_int) rnk FROM `smlTbl_v`) t limit 0;