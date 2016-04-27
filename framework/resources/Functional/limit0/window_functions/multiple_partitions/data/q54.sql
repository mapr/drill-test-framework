-- ntile function with two different windows on top of a join
-- aggregation on top of it
-- ntile function with two different windows on top of a join
-- aggregation on top of it
select
        ntile_100,
        ntile_1000,
        count(ntile_100),
        count(ntile_1000)
from
        (
        select
                j1_v.c_date,
                j1_v.c_integer,
                j4.c_date,
                j4.c_integer,
                ntile(100) over (partition by j1_v.c_date order by j4.c_integer) as ntile_100,
                ntile(1000) over(partition by j1_v.c_date order by j4.c_integer) as ntile_1000
        from
                j1_v
                left outer join
                j4_v j4
        on j1_v.c_integer = j4.c_integer
        ) as dt
group by
        ntile_100,
        ntile_1000
;

