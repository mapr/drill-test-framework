-- Inner join
-- Multiple join conditions
-- String and numeric expressions

select
        SUBSTR(j1.c_varchar,5,6),
        j1.c_boolean,
        j1.c_integer + 1000000000,
        j2.c_integer
from
        j1 INNER JOIN j2
        ON (
            SUBSTR(j1.c_varchar,5,6) = SUBSTR(j2.c_varchar,5,6)
        AND j1.c_boolean = true
        AND j1.c_integer + 1000000000 > j2.c_integer
           )
order by
        SUBSTR(j1.c_varchar,5,6)
;
