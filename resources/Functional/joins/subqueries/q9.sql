SELECT 
	sq4.a,
	sq4.b,
	sq4.c,
	count(sq4.c) as count_x,
	avg(sq4.f)   as avg_x
FROM   
(
   SELECT sq1.x, sq1.y, sq1.x, sq2.x, sq2.y, sq2.z
   FROM
	(SELECT DISTINCT 
			 c_date    as x,
                         c_varchar as y, 
                         c_integer as z
        FROM   j1) sq1 
        LEFT OUTER JOIN (SELECT DISTINCT c_date   as x, 
                                        c_varchar as y, 
                                        c_integer as z
                        FROM   j2) sq2 
       ON (sq1.x = sq2.x) 
       LEFT OUTER JOIN (SELECT DISTINCT c_date    as x, 
                                        c_varchar as y, 
                                        c_integer as z
                        FROM   j3) sq3
       ON(sq1.z = sq3.z) 
) sq4 (a, b, c, d, e, f)
GROUP BY
        sq4.a,
        sq4.b,
        sq4.c
ORDER BY
        sq4.a,
        sq4.b,
        sq4.c
;
