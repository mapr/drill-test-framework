explain plan for select * from (
select 
        substring(o.c_varchar, 1, 4),
        substring(r.c_varchar, 1, 4)
from 
        optional_type_v as o,
        required_type_v as r
where
        o.c_date = r.c_date) t limit 0;
