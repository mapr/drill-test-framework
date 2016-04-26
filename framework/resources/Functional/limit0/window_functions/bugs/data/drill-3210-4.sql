select t2_v.*, *, row_number() over(partition by b2 order by a2), t2_v.* from t2_v order by row_number() over(partition by b2 order by a2);
