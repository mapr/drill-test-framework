explain plan for select * from (
select c1, c2, min ( c1 ) over ( partition by c2 order by c1 nulls first ) w_min from `tblWnulls_v`) t limit 0;
