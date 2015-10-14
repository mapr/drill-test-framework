-- Multiple scalar DISTINCT MIN with all supported data types
select
 	min(distinct c_varchar),
 	min(distinct c_integer),
 	min(distinct c_bigint),
 	min(distinct c_smalldecimal),
 	min(distinct c_bigdecimal),
 	min(distinct c_float),
 	min(distinct c_date),
 	min(distinct c_time),
 	min(distinct c_timestamp)
from 
	alltypes
;
