select c_row, c_decimal38, cast(cast(c_decimal38 as decimal(38,18)) as bigint) from data where c_row <= 14;
