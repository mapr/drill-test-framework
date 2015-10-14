select mod(cast(c_decimal38 as decimal(38,9)), cast(c_decimal18 as decimal(18,9))) from data where c_row < 10 and cast(c_decimal18 as decimal(18,9)) <> 0;
