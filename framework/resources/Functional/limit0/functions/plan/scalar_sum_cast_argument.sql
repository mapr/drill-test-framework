explain plan for select * from (
select 
        sum(cast(o.c_integer as bigint)),
        sum(cast(r.c_integer as bigint)),
        sum(cast(o.c_bigint as bigint)),
        sum(cast(r.c_bigint as bigint)), 
        sum(cast(o.c_float as bigint)),
        sum(cast(r.c_float as bigint)), 
        sum(cast(o.c_double as bigint)),
        sum(cast(r.c_double as bigint))
from 
        optional_type_v as o,
        required_type_v as r
where
        o.c_date = r.c_date) t limit 0;
