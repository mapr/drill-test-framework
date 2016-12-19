SELECT res, 
       (CASE WHEN (false) THEN null ELSE 'let us make this string a little long! yeah just a little long.' END) res1
FROM
(   
    SELECT
        (CASE WHEN (false) THEN null ELSE CAST('let us make this string a little long! yeah just a little long.' AS VARCHAR(1000)) END) res
    FROM (VALUES(1)) sbqry
) subquery;
