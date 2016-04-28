explain plan for select * from (
select 
        sum(1)
from 
        optional_type_v as o,
        required_type_v as r
where
        o.c_date = r.c_date
group by
	o.c_integer,
	r.c_bigint) t limit 0;
