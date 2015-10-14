-- Kitchen sink

alter session set `planner.enable_mergejoin` = false;

select distinct *
from
(
        select  count(*),
                trim(sq1.x1),
                trim(sq2.x1),
                sum(sq1.y1),
                sum(sq2.y1)
        from
        (
                select
                        b1,
                        count(distinct a1)
                from
                        t1
                group by
                        b1
                order by
                        b1 limit 5 offset 1
        ) as sq1(x1, y1)

        inner join

        (
                select
                        b1,
                        count(distinct a1)
                from
                        t1
                group by
                        b1
                order by
                        b1 limit 5 offset 1
        ) as sq2(x1, y1)
        on
                sq1.x1 = sq2.x1 and
                sq2.y1 = sq2.y1
        group by
                trim(sq1.x1),
                trim(sq2.x1),
                sq1.y1,
                sq2.y1
) as dt
order by 2 desc;

alter session set `planner.enable_mergejoin` = true;
