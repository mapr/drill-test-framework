explain plan for select * from (
SELECT * FROM (SELECT c1, c2, lag(c2) OVER ( PARTITION BY c2 ORDER BY c1) lag_c2, NTILE(3) OVER ( PARTITION BY c2 ORDER BY c1) tile FROM `tblWnulls_v`) sub_query WHERE lag_c2 = 'e' ORDER BY tile, c1) t limit 0;