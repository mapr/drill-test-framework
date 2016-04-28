explain plan for select * from (
select 
        count(distinct o.c_integer),
        count(distinct r.c_integer),
        count(distinct o.c_bigint),
        count(distinct r.c_bigint), 
        count(distinct o.c_float),
        count(distinct r.c_float), 
        count(distinct o.c_double),
        count(distinct r.c_double)
from 
        optional_type_v as o,
        required_type_v as r
where
        o.c_date = r.c_date) t limit 0;
