select c_row, cast(c_decimal38 as decimal(38,18)) from data where c_row < 15 order by cast(c_decimal38 as decimal(38,18)) asc;
