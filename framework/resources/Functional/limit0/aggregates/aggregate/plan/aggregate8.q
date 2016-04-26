explain plan for select * from ( select avg(cast(c_int as int)), avg(cast(c_bigint as bigint)), avg(cast(c_float4 as float)), avg(cast(c_float8 as double)) from data ) t limit 0;
