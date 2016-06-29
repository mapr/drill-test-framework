select 
        stddev(o.c_integer),
        stddev(r.c_integer),
        stddev(o.c_bigint),
        stddev(r.c_bigint), 
        stddev(o.c_float),
        stddev(r.c_float), 
        stddev(o.c_double),
        stddev(r.c_double)
from 
        optional_type_v as o,
        required_type_v as r
where
        o.c_date = r.c_date;
