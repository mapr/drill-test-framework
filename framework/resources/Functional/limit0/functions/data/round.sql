select 
        round(sum(o.c_integer)),
        round(sum(r.c_integer)),
        round(sum(o.c_bigint)),
        round(sum(r.c_bigint)), 
        round(sum(o.c_float)),
        round(sum(r.c_float)), 
        round(sum(o.c_double)),
        round(sum(r.c_double))
from 
        optional_type_v as o,
        required_type_v as r
where
        o.c_date = r.c_date;
