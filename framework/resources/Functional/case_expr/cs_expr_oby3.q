SELECT (CASE WHEN true THEN col_int ELSE col_chr end) FROM typeall_l ORDER BY (CASE WHEN false THEN 0 ELSE col_int end) limit 10;
