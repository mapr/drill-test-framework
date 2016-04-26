explain plan for select * from (
select MIN(col_int) OVER() FROM `smlTbl_v`) t limit 0;
