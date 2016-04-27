explain plan for select * from (
select 
        avg(o.c_integer),
        avg(r.c_integer),
        avg(o.c_bigint),
        avg(r.c_bigint), 
        avg(o.c_float),
        avg(r.c_float), 
        avg(o.c_double),
        avg(r.c_double)
from 
        optional_type_v as o,
        required_type_v as r
where
        o.c_date = r.c_date) t limit 0;
