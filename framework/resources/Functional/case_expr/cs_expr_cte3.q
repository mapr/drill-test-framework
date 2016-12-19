with data(v) as
(
    ( SELECT (CASE WHEN true THEN 1 ELSE 0 end) FROM (VALUES(1)) sub_query )
        union all
    ( SELECT (CASE WHEN true THEN 0 ELSE 1 end) FROM (VALUES(1)) sub_query)
)
SELECT
    CASE
        WHEN MIN(v) <= 0 THEN 0
        WHEN MAX(0) >= 100 THEN 1
    END
FROM data;
