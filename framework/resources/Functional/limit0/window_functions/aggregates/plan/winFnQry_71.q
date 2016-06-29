explain plan for select * from (
select c1, rank() over ( partition by c2 order by c1 asc nulls last ) rnk from `tblWnulls_v`) t limit 0;
