-- Multiple scalar count distincts with all supported data types
-- Mixed with count star and non distinct count
select
 	count(*),
 	count(distinct c_varchar),
 	count(c_varchar),
 	count(distinct c_integer),
 	count(c_integer),
 	count(distinct c_bigint),
 	count(c_bigint),
 	count(distinct c_smalldecimal),
 	count(c_smalldecimal),
 	count(distinct c_bigdecimal),
 	count(c_bigdecimal),
 	count(distinct c_float),
 	count(c_float),
 	count(distinct c_date),
 	count(c_date),
 	count(distinct c_time),
 	count(c_time),
 	count(distinct c_timestamp),
 	count(c_timestamp),
 	count(distinct c_boolean),
 	count(c_boolean)
from 
	alltypes
;
