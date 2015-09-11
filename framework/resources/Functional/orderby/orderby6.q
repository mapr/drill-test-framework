select c_row, cast(c_decimal18 as decimal(18,4)) from data where c_row > 15 order by cast(c_decimal18 as decimal(18,4)) asc;
