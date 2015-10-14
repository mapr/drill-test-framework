select
 	avg(distinct c_bigint) + avg(c_integer),
 	sum(distinct c_bigint) + 100,
	count(*)
from 
	alltypes
where
        c_bigint = 884838034226544640
;
