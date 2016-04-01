alter session set `planner.slice_target` = 1;

select
        j1_v.c_integer,
        sum(j1_v.c_integer) over w
from j1_v
window  w as (order by c_integer desc)
order by
        1, 2;

alter session set `planner.slice_target` = 100000;
