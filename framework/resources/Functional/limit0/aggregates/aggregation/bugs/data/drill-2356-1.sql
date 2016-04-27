-- ROUND function inside sum 
select
     cast(sum(c_bigint) as bigint)         as sum_c_bigint,
     sum(ROUND(cast(c_bigint as bigint)/12)) 		   as sum_round_exp,
     cast(sum(ROUND(c_bigint/12)) as bigint) 
from
     alltypes_with_nulls
group by
     cast(c_varchar as varchar(10)),
     cast(c_integer as int),
     cast(c_date as date),
     cast(c_time as time),
     cast(c_boolean as boolean)
order by
	1,2;
