select cast(c_row as int), cast(c_float8 as float) c_float8, convert_from(convert_to(c_float8, 'DOUBLE'), 'DOUBLE') from data;
