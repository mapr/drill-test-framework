SELECT c1, dense_rnk FROM ( SELECT c1, dense_rank() OVER ( PARTITION BY c2 ORDER BY c1 ASC nulls last ) dense_rnk FROM `tblWnulls_v`) sub_query WHERE c1 IS NOT null;