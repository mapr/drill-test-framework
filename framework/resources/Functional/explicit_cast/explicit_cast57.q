select c_row, c_decimal38, cast(cast(c_decimal38 as decimal(38,10)) as decimal(18,7)) from data where c_row = 9;
