explain plan for select * from (
SELECT MAX(col_int) OVER (PARTITION BY col_vchar_52) max_int, col_vchar_52, col_int FROM `smlTbl_v` WHERE col_vchar_52 = 'DXXXXXXXXXXXXXXXXXXXXXXXXXEXXXXXXXXXXXXXXXXXXXXXXXXF') t limit 0;