select 
        coalesce(o.c_varchar, r.c_varchar) 	as a,
        coalesce(r.c_varchar, o.c_varchar)	as b,
        coalesce(o.c_integer, r.c_integer)	as c,
        coalesce(r.c_integer, o.c_integer)	as d,
        coalesce(o.c_bigint, r.c_bigint)	as e,
        coalesce(r.c_bigint, o.c_bigint)	as f,
        coalesce(o.c_date, r.c_date)		as g,
        coalesce(r.c_date, o.c_date)		as h,
        coalesce(o.c_time, r.c_time)		as i,
        coalesce(r.c_time, o.c_time)		as j,
        coalesce(o.c_timestamp, r.c_timestamp)	as k,
        coalesce(r.c_timestamp, o.c_timestamp)	as l,
        coalesce(o.c_boolean, r.c_boolean)	as m,
        coalesce(r.c_boolean, o.c_boolean)	as n,
        coalesce(o.c_float, r.c_float)		as o,
        coalesce(r.c_float, o.c_float)		as p,
        coalesce(o.c_double, r.c_double)	as q,
        coalesce(r.c_double, o.c_double)	as r
from 
        optional_type_v as o,
        required_type_v as r
where
        o.c_date = r.c_date
order by a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r;
