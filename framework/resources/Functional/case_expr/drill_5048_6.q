SELECT res, CASE res WHEN true THEN CAST('1990-10-10 22:40:50' AS TIMESTAMP) ELSE null END
FROM
(
     SELECT
     (CASE WHEN CAST(1 as BOOLEAN) THEN true ELSE null END) res
     FROM (values(1)) foo
) foobar;
