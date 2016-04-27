explain plan for select * from (
select 
        max(o.c_integer) + max(r.c_integer),
        max(o.c_integer) - max(r.c_integer),
        max(o.c_bigint) / max(r.c_bigint), 
        round(max(o.c_double) *  max(r.c_double))
from 
        optional_type_v as o,
        required_type_v as r
where
        o.c_date = r.c_date) t limit 0;
