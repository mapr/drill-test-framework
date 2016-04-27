-- Multiple count distincts with different data types
explain plan for select * from (
select
        count(distinct c_varchar),
        count(distinct c_integer),
        count(distinct c_bigint),
        count(distinct c_smalldecimal),
        count(distinct c_bigdecimal),
        count(distinct c_float),
        count(distinct c_date),
        count(distinct c_time),
        count(distinct c_timestamp),
        count(distinct c_boolean)
from
        alltypes_v
) t limit 0;
