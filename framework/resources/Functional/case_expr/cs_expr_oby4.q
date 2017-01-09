SELECT (CASE WHEN true THEN col_int ELSE 0 end),col_bln FROM typeall_l GROUP BY col_int,col_bln ORDER BY (CASE WHEN false THEN 0 ELSE col_int end) limit 10;
