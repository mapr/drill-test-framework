explain plan for select * from (
SELECT col_vchar_52, col_int, DENSE_RANK () OVER (PARTITION BY col_vchar_52 order by col_int) dense_rnk FROM `smlTbl_v`) t limit 0;