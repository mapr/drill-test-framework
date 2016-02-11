select 
        sum(o.c_integer),
        sum(r.c_integer),
        sum(o.c_bigint),
        sum(r.c_bigint), 
        sum(o.c_float),
        sum(r.c_float), 
        sum(o.c_double),
        sum(r.c_double)
from 
        optional_type_v as o,
        required_type_v as r
where
        o.c_date = r.c_date;
