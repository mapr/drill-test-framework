select 
        count(o.c_integer),
        count(r.c_integer),
        count(o.c_bigint),
        count(r.c_bigint), 
        count(o.c_float),
        count(r.c_float), 
        count(o.c_double),
        count(r.c_double)
from 
        optional_type_v as o,
        required_type_v as r
where
        o.c_date = r.c_date;
