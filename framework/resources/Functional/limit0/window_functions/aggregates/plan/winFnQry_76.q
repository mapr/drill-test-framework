explain plan for select * from (
select c1, c2, count ( c1 ) over ( partition by c2 order by c1 asc nulls first ) w_count from `tblWnulls_v` where c2 not in ('a','b','c')) t limit 0;
