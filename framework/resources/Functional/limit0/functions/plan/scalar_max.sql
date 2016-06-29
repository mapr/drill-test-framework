explain plan for select * from (
select 
        max(o.c_varchar),
        max(r.c_varchar),
        max(o.c_integer),
        max(r.c_integer),
        max(o.c_bigint),
        max(r.c_bigint), 
        max(o.c_float),
        max(r.c_float), 
        max(o.c_double),
        max(r.c_double), 
        max(o.c_date),
        max(r.c_date), 
        max(o.c_time),
        max(r.c_time), 
        max(o.c_timestamp),
        max(r.c_timestamp) 
from 
        optional_type_v as o,
        required_type_v as r
where
        o.c_date = r.c_date) t limit 0;
