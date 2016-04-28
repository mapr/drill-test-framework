explain plan for select * from (
select c1, row_number() over ( partition by c2 order by c1 asc nulls last ) row_rnk from `tblWnulls_v`) t limit 0;
