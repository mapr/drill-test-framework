select cast(c_groupby as varchar(4)), max(distinct(c_int)), max(distinct(c_bigint)), max(distinct(c_float4)), max(distinct(c_float8)) from data group by c_groupby;
