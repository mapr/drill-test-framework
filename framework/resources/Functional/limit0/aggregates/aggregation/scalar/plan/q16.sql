-- Difference with postgres
-- if I have count(distinct c_integer + c_integer) it overflows in postgres, drill returns correct result
explain plan for select * from (
select
	count(distinct c_integer-100 )
from 
	alltypes_v
having 
	count(distinct c_date) > 0) t limit 0;
