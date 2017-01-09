SELECT
    (CASE WHEN (false) THEN null ELSE 1 END) res1,
    (CASE WHEN (false) THEN null ELSE CAST(0.1 as float) END) res2,
    (CASE WHEN (false) THEN null ELSE CAST(9223372036854775807 as BIGINT) END) res3,
    (CASE WHEN (false) THEN null ELSE CAST('1985-06-10' AS DATE) END) res4,
    (CASE WHEN (false) THEN null ELSE CAST('15:30:59' AS TIME) END) res5,
    (CASE WHEN (false) THEN null ELSE CAST('1990-10-10 22:40:50' AS TIMESTAMP) END) res6,
    (CASE WHEN (false) THEN null ELSE CAST(99.987 AS DOUBLE PRECISION) END) res7,
    (CASE WHEN (false) THEN null ELSE CAST('test string' as CHAR(11)) END) res8,
    (CASE WHEN (false) THEN null ELSE CAST('let us make this string a little long! yeah just a little long.' AS VARCHAR(1000)) END) res9,
    (CASE WHEN (false) THEN null ELSE CAST(65000 as INT) END) res12
FROM (VALUES(1)) foobar;
