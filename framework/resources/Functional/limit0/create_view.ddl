create or replace view optional_type_v as 
select
	cast(c_varchar as varchar(100)),
	cast(c_integer as integer),
	cast(c_bigint as bigint),
	cast(c_float as float),
	cast(c_double as double), 
	cast(c_date as date),
	cast(c_time as time),
	cast(c_timestamp as timestamp),
	cast(c_boolean as boolean)
from 
	j1
;

create or replace view required_type_v as      
select
        cast(c_varchar as varchar(100)),
        cast(c_integer as integer),
        cast(c_bigint as bigint),
        cast(c_float as float),
        cast(c_double as double),
        cast(c_date as date),
        cast(c_time as time),
        cast(c_timestamp as timestamp),
        cast(c_boolean as boolean)
from 
        j3
;
