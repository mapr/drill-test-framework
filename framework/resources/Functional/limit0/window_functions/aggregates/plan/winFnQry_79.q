explain plan for select * from (
select c1, c2, w_min from ( select c1, c2, min ( c1 ) over ( partition by c2 order by c1 asc nulls first ) w_min from `tblWnulls_v` ) sub_query where w_min is not null) t limit 0;
