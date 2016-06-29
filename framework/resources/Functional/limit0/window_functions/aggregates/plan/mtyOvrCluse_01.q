explain plan for select * from (
select MAX(col_int) OVER() FROM `smlTbl_v`) t limit 0;
