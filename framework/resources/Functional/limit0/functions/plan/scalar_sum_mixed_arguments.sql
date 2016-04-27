explain plan for select * from (
select 
        sum(o.c_integer + r.c_integer)
from 
        optional_type_v as o,
        required_type_v as r
where
        o.c_date = r.c_date) t limit 0;
