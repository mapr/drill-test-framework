-- count distinct in having clause
explain plan for select * from (
select
	count(distinct c_integer),
	count(distinct c_date)
from 
	alltypes_v
having 
	count(distinct c_date) > 0) t limit 0;
