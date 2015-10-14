select cast(c_groupby as varchar(4)), avg(distinct(c_int)), avg(distinct(c_bigint)), avg(distinct(c_float4)), avg(distinct(c_float8)) from data where c_row <> 6 and c_row <> 7 group by c_groupby;
