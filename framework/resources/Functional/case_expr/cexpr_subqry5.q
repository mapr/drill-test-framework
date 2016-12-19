SELECT res, (CASE res WHEN CAST(0.1 AS FLOAT) THEN CAST(0.9999 AS FLOAT) ELSE null END) res1
FROM
(   
    SELECT
        (CASE WHEN (false) THEN null ELSE CAST(0.1 as float) END) res
    FROM (VALUES(1)) sbqry
) subquery;
