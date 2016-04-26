explain plan for select * from (
-- Multiple window defintions
select
        sum(c_integer) over w1,
        count(*)       over w2
from
        j1_v
window w1 as (order by c_date), w2 as (partition by c_bigint order by c_date, c_time)
) t limit 0;
