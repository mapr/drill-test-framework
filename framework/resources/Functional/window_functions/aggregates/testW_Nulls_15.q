SELECT c1, c2, w_MIN FROM ( SELECT c1, c2, MIN ( c1 ) OVER ( PARTITION BY c2 ORDER BY c1 ASC nulls last ) w_MIN FROM `tblWnulls.parquet` ) sub_query;