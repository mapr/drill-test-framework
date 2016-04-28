explain plan for select * from (
select count(*) from cast_tbl_1_v a, cast_tbl_2_v b where a.c_double = b.c_integer) t limit 0;
