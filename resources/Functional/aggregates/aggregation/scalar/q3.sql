-- Multiple scalar distinct AVG with all supported data types
-- Mixed with count star and non distinct count
select
 	count(*),
 	avg(distinct c_integer),
 	avg(c_integer),
 	avg(distinct c_bigint),
 	avg(c_bigint),
 	avg(distinct c_smalldecimal),
 	avg(c_smalldecimal),
 	avg(distinct c_bigdecimal),
 	avg(c_bigdecimal)
 	--avg(distinct c_float),
 	--avg(c_float)
from 
	alltypes
where
        c_bigint = 884838034226544640
;
