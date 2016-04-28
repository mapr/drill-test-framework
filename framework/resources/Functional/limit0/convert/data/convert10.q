select cast(c_row as int), cast(c_float4 as float) c_float4, convert_from(convert_to(c_float4, 'FLOAT'), 'FLOAT') from data;
