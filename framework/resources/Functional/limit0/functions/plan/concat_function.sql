explain plan for select * from (
select 
        concat(o.c_varchar, o.c_varchar),
        concat(r.c_varchar, o.c_varchar),
        concat(o.c_varchar, r.c_varchar),
        concat(r.c_varchar, r.c_varchar)
from 
        optional_type_v as o,
        required_type_v as r
where
        o.c_date = r.c_date) t limit 0;
