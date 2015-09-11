select c_row, cast(c_decimal18 as varchar(20)), cast(cast(c_decimal18 as decimal(18,9)) as decimal(28,10)) from data where c_row = 9;
