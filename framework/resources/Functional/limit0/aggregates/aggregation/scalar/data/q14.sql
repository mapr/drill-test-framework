-- count distinct in having clause
select
	count(distinct c_integer),
	count(distinct c_date)
from 
	alltypes_v
having 
	count(distinct c_date) > 0;
