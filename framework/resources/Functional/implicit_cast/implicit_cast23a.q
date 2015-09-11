select c_row, c_float8 / cast(c_decimal18 as decimal(18,9)) from data where c_row > 1 and c_row < 10;
