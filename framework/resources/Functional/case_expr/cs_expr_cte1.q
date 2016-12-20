with data(v) as
(
    ( SELECT (CASE WHEN true THEN 1 ELSE 0 end) FROM (VALUES(1)) sub_query )
        union all
    ( SELECT (CASE WHEN true THEN 0 ELSE 1 end) FROM (VALUES(1)) sub_query )
) SELECT v FROM data;
