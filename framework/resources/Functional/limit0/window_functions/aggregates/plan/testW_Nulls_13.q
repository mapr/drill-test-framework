explain plan for select * from (
SELECT c1, c2, w_MAX FROM ( SELECT c1, c2, MAX ( c1 ) OVER ( PARTITION BY c2 ORDER BY c1 ASC nulls last ) w_MAX FROM `tblWnulls_v` ) sub_query) t limit 0;