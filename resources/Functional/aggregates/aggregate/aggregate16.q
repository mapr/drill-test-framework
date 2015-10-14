select sum(c_int), sum(c_bigint), sum(c_float4), sum(c_float8), sum(cast(c_decimal9 as decimal(18,9))), sum(cast(c_decimal18 as decimal(38,18))) from data;
