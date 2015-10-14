-- ROUND function inside sum 
select
     cast(sum(c_bigint) as bigint)         as sum_c_bigint,
     sum(ROUND(c_bigint/12)) 		   as sum_round_exp,
     cast(sum(ROUND(c_bigint/12)) as bigint) 
from
     alltypes_with_nulls
group by
     c_varchar,
     c_integer,
     c_date,
     c_time,
     c_boolean
order by
	1,2;
