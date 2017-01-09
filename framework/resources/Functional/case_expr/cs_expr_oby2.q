SELECT (CASE WHEN true THEN col_int ELSE col_chr end) FROM typeall_l ORDER BY (CASE WHEN true THEN col_int ELSE 0 end) limit 10;
