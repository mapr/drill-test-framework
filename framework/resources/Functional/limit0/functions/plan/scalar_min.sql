explain plan for select * from (
select 
        min(o.c_varchar),
        min(r.c_varchar),
        min(o.c_integer),
        min(r.c_integer),
        min(o.c_bigint),
        min(r.c_bigint), 
        min(o.c_float),
        min(r.c_float), 
        min(o.c_double),
        min(r.c_double), 
        min(o.c_date),
        min(r.c_date), 
        min(o.c_time),
        min(r.c_time), 
        min(o.c_timestamp),
        min(r.c_timestamp) 
from 
        optional_type_v as o,
        required_type_v as r
where
        o.c_date = r.c_date) t limit 0;
