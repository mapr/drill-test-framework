SELECT res
FROM
(   
    SELECT
        (CASE WHEN (false) THEN null ELSE CAST(0.1 as float) END) res
    FROM (VALUES(1)) sbqry
) subquery;
