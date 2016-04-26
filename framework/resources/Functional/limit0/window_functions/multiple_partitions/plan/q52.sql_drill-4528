explain plan for select * from (
-- left outer join between two tables
-- windowed aggregate on column from the left side
-- windowed aggregate on column from the right side
-- 2 different windows
select
        j2.c_boolean,
        j2.c_date,
        j2.c_integer,
        sum(j1_v.c_integer) over (partition by j1_v.c_boolean order by j1_v.c_date, j1_v.c_integer),
        avg(j2.c_integer) over (partition by j2.c_boolean order by j2.c_date, j2.c_integer),
        sum(j1_v.c_integer) over (partition by j1_v.c_date ,j1_v.c_date, j1_v.c_bigint),
        avg(j2.c_integer) over (partition by j2.c_date ,j2.c_date, j2.c_bigint)
from    j1_v
           left outer join
        j2_v j2 on j1_v.c_integer = j2.c_integer
order by 1,2,3) t limit 0;
