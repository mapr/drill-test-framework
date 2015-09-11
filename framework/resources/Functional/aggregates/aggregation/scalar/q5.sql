-- Multiple scalar DISTINCT MAX with all supported data types
select
 	max(distinct c_varchar),
 	max(distinct c_integer),
 	max(distinct c_bigint),
 	max(distinct c_smalldecimal),
 	max(distinct c_bigdecimal),
 	max(distinct c_float),
 	max(distinct c_date),
 	max(distinct c_time),
 	max(distinct c_timestamp)
from 
	alltypes
;
