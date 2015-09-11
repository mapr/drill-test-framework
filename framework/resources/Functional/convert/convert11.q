select c_row, c_float8, convert_from(convert_to(c_float8, 'DOUBLE'), 'DOUBLE') from data;
