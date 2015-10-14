select c_row, c_decimal28, cast(cast(c_decimal28 as decimal(28,6)) as decimal(18,6)) from data where c_row = 8;
