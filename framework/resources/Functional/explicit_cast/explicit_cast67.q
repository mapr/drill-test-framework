select c_row, c_decimal38, cast(cast(c_decimal38 as decimal(38,4)) as decimal(9,4)) from data where c_row = 8;
