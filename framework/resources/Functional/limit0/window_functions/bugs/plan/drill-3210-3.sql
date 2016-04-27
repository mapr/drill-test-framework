explain plan for select * from (select t2_v.*, *, row_number() over(partition by b2 order by a2) from t2_v order by row_number() over(partition by b2 order by a2)) t limit 0;
