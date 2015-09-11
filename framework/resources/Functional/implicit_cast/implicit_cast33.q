select c_float8 from data where c_row < 12 and c_float8 <> cast(c_decimal28 as decimal(28,9));
