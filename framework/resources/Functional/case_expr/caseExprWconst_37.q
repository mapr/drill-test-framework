SELECT (res1 = 'qwe') res2 FROM 
(
    SELECT 
          (CASE WHEN (false) THEN null ELSE 'qwe' END) res1 
    FROM (VALUES(1)) test_tbl
) test;
