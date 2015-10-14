select cast(c_groupby as varchar(4)), sum(c_int), sum(c_bigint), sum(c_float4), sum(c_float8) from data where c_row <> 7 and c_row <> 11 group by c_groupby;
