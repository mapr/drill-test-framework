select c_row, c_decimal28, div(cast(c_decimal28 as decimal(28,9)), cast(c_decimal28 as decimal(28,9))) from data where c_row <= 11 and c_row > 1;
