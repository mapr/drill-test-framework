select c_row, c_decimal28, cast(cast(c_decimal28 as decimal(28,9)) as bigint) from data where c_row < 12;
