explain plan for select * from (
select c1, c2, max ( c1 ) over ( partition by c2 order by c1 nulls first ) w_max from `tblWnulls_v`) t limit 0;
