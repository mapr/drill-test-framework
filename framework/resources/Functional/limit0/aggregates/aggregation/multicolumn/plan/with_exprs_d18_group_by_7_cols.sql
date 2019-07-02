explain plan for select * from (
select

				
		count(*)			as count_star,
 		sum(a.d18)		as sum_d18,
 		--round(avg(a.d18))	as round_avg_d18,
 		cast(avg(a.d18) as bigint)	as round_avg_d18,
 		--trunc(avg(a.d18))	as trunc_avg_d18,
 		cast(avg(a.d18) as bigint)	as trunc_avg_d18,
 		--sum(case when a.d18 = 0 then 100 else round(a.d18/12) end) as case_in_sum_d18,
 		cast(sum(case when a.d18 = 0 then 100 else round(a.d18/12) end) as bigint) as case_in_sum_d18,
 		--coalesce(sum(case when a.d18 = 0 then 100 else round(a.d18/12) end), 0) as case_in_sum_d18
 		cast(coalesce(sum(case when a.d18 = 0 then 100 else round(a.d18/12) end), 0) as bigint) as case_in_sum_d18_0
 
from
 		alltypes_with_nulls_v a
		left outer join alltypes_with_nulls_v b on (a.c_integer = b.c_integer)
		left outer join alltypes_with_nulls_v c on (b.c_integer = c.c_integer)
group by
  		a.c_varchar
 		,b.c_varchar
 		,c.c_varchar
 		,a.c_integer
 		,b.c_integer
 		,c.c_integer
 		,a.d9

 order by
  		a.c_varchar
 		,b.c_varchar
 		,c.c_varchar
 		,a.c_integer
 		,b.c_integer
 		,c.c_integer
 		,a.d9
) t limit 0;
