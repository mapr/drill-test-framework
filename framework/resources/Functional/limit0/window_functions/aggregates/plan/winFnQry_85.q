explain plan for select * from (
select c1, c2, rank() over ( partition by c2 order by c1 asc ) rnk, row_number() over ( partition by c2 order by c1 asc ) rw_num, dense_rank() over ( partition by c2 order by c1 asc ) dense_rnk, percent_rank() over ( partition by c2 order by c1 asc ) prct_rnk, cume_dist() over ( partition by c2 order by c1 asc ) cume_dst from `tblWnulls_v`) t limit 0;
