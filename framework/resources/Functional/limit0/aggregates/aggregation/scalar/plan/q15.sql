-- count distinct in having clause
-- count distinct in having clause is not projected
explain plan for select * from (
select
	count(distinct c_integer)
from 
	alltypes_v
having 
	count(distinct c_date) > 0) t limit 0;
