select

				
		count(*)			as count_star,
 		sum(a.d28)		as sum_d28,
 		--round(avg(a.d28))	as round_avg_d28,
 		cast(avg(a.d28) as bigint)	as round_avg_d28,
 		--trunc(avg(a.d28))	as trunc_avg_d28,
 		cast(avg(a.d28) as bigint)	as trunc_avg_d28,
 		--sum(case when a.d28 = 0 then 100 else round(a.d28/12) end) as case_in_sum_d28,
 		cast(sum(case when a.d28 = 0 then 100 else round(a.d28/12) end) as bigint) as case_in_sum_d28,
 		--coalesce(sum(case when a.d28 = 0 then 100 else round(a.d28/12) end), 0) as case_in_sum_d28
 		cast(coalesce(sum(case when a.d28 = 0 then 100 else round(a.d28/12) end), 0) as bigint) as case_in_sum_d28
 
from
 		alltypes_with_nulls a
		left outer join alltypes_with_nulls b on (a.c_integer = b.c_integer)
		left outer join alltypes_with_nulls c on (b.c_integer = c.c_integer)
group by
  		a.c_varchar
 		,b.c_varchar
 		,c.c_varchar
 		,a.c_integer
 		,b.c_integer
 		,c.c_integer
 		,a.d9
 		,b.d9
 		,c.d9
 		,a.d18
 		,b.d18
 		,c.d18
 		,a.d28
 		,b.d28
 		,c.d28
 		,a.d38
 		,b.d38
 		,c.d38
 		,a.c_date
 		,b.c_date
 		,c.c_date
 		,a.c_date
 		,b.c_date
 		,c.c_date
 		,a.c_time
 		,b.c_time
 		,c.c_time
 		,a.c_timestamp

 order by
  		a.c_varchar
 		,b.c_varchar
 		,c.c_varchar
 		,a.c_integer
 		,b.c_integer
 		,c.c_integer
 		,a.d9
 		,b.d9
 		,c.d9
 		,a.d18
 		,b.d18
 		,c.d18
 		,a.d28
 		,b.d28
 		,c.d28
 		,a.d38
 		,b.d38
 		,c.d38
 		,a.c_date
 		,b.c_date
 		,c.c_date
 		,a.c_date
 		,b.c_date
 		,c.c_date
 		,a.c_time
 		,b.c_time
 		,c.c_time
 		,a.c_timestamp
;
