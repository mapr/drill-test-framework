-- count distinct on the same column
-- check explain plan to verify that it is evaluated only once
select
        count(distinct c_varchar) as a1,
        count(distinct c_varchar) as a2,
        count(distinct c_varchar) as a3,
        count(distinct c_varchar) as a4,
        count(distinct c_varchar) as a5,
        count(distinct c_varchar) as a6,
        count(distinct c_varchar) as a7,
        count(distinct c_varchar) as a8,
        count(distinct c_varchar) as a9,
        count(distinct c_varchar) as a10
from
        alltypes
;
