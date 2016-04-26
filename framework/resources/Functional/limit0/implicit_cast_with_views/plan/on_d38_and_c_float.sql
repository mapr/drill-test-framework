explain plan for select * from (
select count(*) from cast_tbl_1_v a, cast_tbl_2_v b where a.d38 = b.c_float) t limit 0;
