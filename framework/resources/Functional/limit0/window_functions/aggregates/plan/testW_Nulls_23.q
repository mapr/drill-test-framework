explain plan for select * from (
SELECT c1, rnk FROM ( SELECT c1, rank() OVER ( PARTITION BY c2 ORDER BY c1 ASC nulls last ) rnk FROM `tblWnulls_v`) sub_query WHERE rnk IS NOT null) t limit 0;