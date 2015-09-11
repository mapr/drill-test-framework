select c_row, cast(c_decimal38 as decimal(38,9)) / cast(c_decimal28 as decimal(28,9)) from data where c_row > 1 and c_row < 10;
