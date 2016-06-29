explain plan for select * from ( select max(cast(c_int as int)), max(cast(c_bigint as bigint)), max(cast(c_float4 as float)), max(cast(c_float8 as double)) from data ) t limit 0;
