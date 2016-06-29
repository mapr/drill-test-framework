explain plan for select * from (
select count(*) from cast_tbl_1_v a, cast_tbl_2_v b where a.d9 = b.c_double) t limit 0;
