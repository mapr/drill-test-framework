select 
        sum(o.c_integer),
        sum(r.c_integer),
        sum(o.c_bigint),
        sum(r.c_bigint)
from 
        optional_type_v as o,
        required_type_v as r
where
        o.c_date = r.c_date
group by
	o.c_date,
	r.c_timestamp;
