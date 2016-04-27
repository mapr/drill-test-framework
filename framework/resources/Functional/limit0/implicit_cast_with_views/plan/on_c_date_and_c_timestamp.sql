explain plan for select * from (
select count(*) from cast_tbl_1 a, cast_tbl_2 b where a.c_date = b.c_timestamp) t limit 0;
