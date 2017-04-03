SELECT res, CASE res WHEN CAST('2011-03-10' AS DATE) THEN true ELSE null END
FROM
(
     SELECT
     (CASE WHEN (true) THEN CAST('2011-03-10' AS DATE) ELSE null END) res
     FROM (values(1)) foo
) foobar;
