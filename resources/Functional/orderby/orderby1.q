select c_row, cast(c_decimal28 as decimal(28,9)) from data where c_row < 12 order by cast(c_decimal28 as decimal(28,9)) asc;
