SELECT * 
FROM 
(
    SELECT 
          (CASE WHEN (true) THEN 'qwe' ELSE null END) res1 
    FROM (VALUES(1)) test_tbl
) test  
where res1 IN ('ab','dab','qw','qwe');
