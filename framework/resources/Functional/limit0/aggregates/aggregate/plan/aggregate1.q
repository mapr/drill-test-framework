explain plan for select * from ( select cast(c_groupby as varchar(5)), min(cast(c_int as int)), min(cast(c_bigint as bigint)), min(cast(c_float4 as float)), min(cast(c_float8 as double)) from data group by c_groupby ) t limit 0;
