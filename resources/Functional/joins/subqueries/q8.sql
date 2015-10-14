-- Filters in subqueries
-- Join between 3 subqueries (inner/left outer join)

SELECT     * 
FROM       ( 
                  SELECT c_timestamp, 
                         c_varchar, 
                         c_date, 
                         c_integer 
                  FROM   j1 ) AS sq3(a,b,c,d) 
INNER JOIN 
           ( 
                            SELECT           sq2.x, 
                                             sq2.y 
                            FROM             ( 
                                                    SELECT c_date, 
                                                           c_varchar 
                                                    FROM   j1 
                                                    WHERE  c_bigint IS NOT NULL 
                                                    AND    c_integer IN ( -499871720, 
                                                                         -499763274, 
                                                                         -499564607 , 
                                                                         -499395929, 
                                                                         -499233550, 
                                                                         -499154096, 
                                                                         -498966611, 
                                                                         -498828740, 
                                                                         -498749284 ) 
                                                    AND    c_boolean IS true ) AS sq1(x, y) 
                            RIGHT OUTER JOIN 
                                             ( 
                                                    SELECT c_timestamp, 
                                                           c_varchar 
                                                    FROM   j2 ) AS sq2(x, y) 
                            ON               ( 
                                                              sq1.x = cast(sq2.x AS date)) 
                            WHERE            sq2.x NOT IN ( '2015-03-01 01:49:46' , 
                                                           '2015-03-01 01:42:47', 
                                                           '2015-03-01 01:30:41' ) 
                            ORDER BY         sq2.x nulls first limit 5 offset 5 ) AS sq4(a,b) 
ON         ( 
                      sq3.a = sq4.a) 
;
