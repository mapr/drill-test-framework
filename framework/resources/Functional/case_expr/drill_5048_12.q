SELECT res, CASE res WHEN CAST('22:40:50' AS TIME) THEN true ELSE null END
FROM
(
     SELECT
     (CASE WHEN (false) THEN null ELSE CAST('22:40:50' AS TIME) END) res
     FROM (values(1)) foo
) foobar;
