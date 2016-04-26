explain plan for select * from (
select SUM(col_int) OVER() FROM `smlTbl_v`) t limit 0;
