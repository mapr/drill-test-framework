explain plan for select * from (
-- left outer join between two tables
-- windowed aggregate on column from the left side
-- windowed aggregate on column from the right side
select
        j1_v.c_boolean,
        j1_v.c_date,
        sum(j1_v.c_integer)       over (partition by j1_v.c_boolean order by j1_v.c_date),
        avg(j4.c_integer)       over (partition by j4.c_boolean order by j4.c_date),
        rank()                  over (order by j1_v.c_integer)
from
        j1_v
                left outer join
        j4_v j4 on j1_v.c_integer = j4.c_integer
order by
        1, 2) t limit 0;
