-- Multiple scalar distinct SUM with all supported data types
-- Mixed with count star and non distinct count
explain plan for select * from (
select
 	count(*),
 	sum(distinct c_integer),
 	sum(c_integer),
 	sum(distinct c_bigint),
 	sum(c_bigint),
 	sum(distinct c_smalldecimal),
 	sum(c_smalldecimal),
 	sum(distinct c_bigdecimal),
 	sum(c_bigdecimal)
 	--sum(distinct c_float),
 	--sum(c_float)
from 
	alltypes_v
where
        c_bigint = 884838034226544640
) t limit 0;
