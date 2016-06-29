explain plan for select * from (
select c1, percent_rank() over ( partition by c2 order by c1 asc nulls last ) prct_rnk from `tblWnulls_v`) t limit 0;
