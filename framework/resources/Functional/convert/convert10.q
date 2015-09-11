select c_row, c_float4, convert_from(convert_to(c_float4, 'FLOAT'), 'FLOAT') from data;
