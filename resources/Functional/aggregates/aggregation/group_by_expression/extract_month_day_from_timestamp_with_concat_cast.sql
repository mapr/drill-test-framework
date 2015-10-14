select  
	cast(cast(concat(extract(day from c_timestamp), extract(month from c_timestamp), extract(year from c_timestamp)) as varchar(255)) as varchar(50)),
	sum(c_integer)	as sum1,
	sum(c_smalldecimal) as sum2,
	sum(c_bigdecimal) as sum3,
	sum(c_float) as sum4,
	sum(c_bigint - c_integer) as sum5,
	avg(c_bigint) as avg1,
	avg(c_integer) as avg2,
	avg(c_smalldecimal) as avg3
from 
	alltypes  
group by 
	cast(concat(extract(day from c_timestamp), extract(month from c_timestamp), extract(year from c_timestamp)) as varchar(255))
order by 
	cast(concat(extract(day from c_timestamp), extract(month from c_timestamp), extract(year from c_timestamp)) as varchar(255))
;
