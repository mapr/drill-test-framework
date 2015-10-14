select cast(c_groupby as varchar(4)), count(distinct(c_int)), count(distinct(c_bigint)), count(distinct(c_float4)), count(distinct(c_float8)) from data group by c_groupby;
