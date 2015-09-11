-- Local filter is on both sides of the join
select
        *
from
        j1 RIGHT OUTER JOIN j4
        ON ( j1.c_date = j4.c_date
        and j1.c_time = j4.c_time
        and j1.c_timestamp = j4.c_timestamp
        and j1.c_varchar = j4.c_varchar
)
where
        j1.c_integer > 0
        and j1.c_integer IS NOT NULL
        and j4.c_integer IS NULL
;
