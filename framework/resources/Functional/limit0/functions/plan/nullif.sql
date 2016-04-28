explain plan for select * from (
select 
        nullif(o.c_integer, r.c_integer),
        nullif(o.c_bigint, r.c_bigint), 
        nullif(o.c_float, r.c_float), 
        nullif(o.c_double, r.c_double),
        nullif(o.c_date, o.c_date),
        nullif(r.c_date, cast('2015-12-07' as date)), 
        nullif(o.c_float, r.c_float), 
        nullif(o.c_double, r.c_double)
from 
        optional_type_v as o,
        required_type_v as r
where
        o.c_date = r.c_date) t limit 0;
