explain plan for select * from (
select 
        case when substr(o.c_varchar, 1, 2) = '00' then 'x' else cast(null as varchar(10)) end,
        case when substr(r.c_varchar, 1, 2) = '00' then 'y' else cast(null as varchar(10)) end,
	coalesce(case when substr(o.c_varchar, 1, 2) = '00' then 'x' else cast(null as varchar(10)) end,
		 case when substr(r.c_varchar, 1, 2) = '00' then 'y' else cast(null as varchar(10)) end),

        case when o.c_integer < 0 then -1 else o.c_integer end,
        case when r.c_integer < 0 then -1 else cast(null as integer) end,

        case when o.c_bigint < 0 then -1 else o.c_bigint end,
        case when r.c_bigint < 0 then -1 else cast(null as integer) end,

        case when o.c_bigint < 0 then -1 else o.c_bigint end,
        case when r.c_bigint < 0 then -1 else r.c_bigint end,

        case when o.c_float < 0 then -1 else r.c_float end,
        case when r.c_float < 0 then -1 else o.c_float end,

        case when o.c_double < 0 then -1 else r.c_double end,
        case when r.c_double < 0 then -1 else o.c_double end,
	
	case when o.c_date = date '2010-01-01' then date '2015-12-07' else r.c_date end,
        case when r.c_date = date '2010-01-01' then date '2015-12-07' else o.c_date end,

	case when o.c_time = time '00:00:00' then time '00:00:01' else r.c_time end,
        case when r.c_time = time '00:00:00' then time '00:00:01' else o.c_time end,
  
	case when o.c_timestamp = timestamp '2010-01-01 00:00:01' then timestamp '2015-12-07 17:00:01' else r.c_timestamp end,
        case when r.c_timestamp = timestamp '2010-01-01 00:00:01' then timestamp '2015-12-07 17:00:01' else o.c_timestamp end 
from 
        optional_type_v as o,
        required_type_v as r
where
        o.c_date = r.c_date
order by
	1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19) t limit 0;
