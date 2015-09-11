select c_row, c_groupby, cast(c_decimal28 as decimal(28,9)) from data where c_row < 12 order by c_groupby asc, cast(c_decimal28 as decimal(28,9)) desc;
