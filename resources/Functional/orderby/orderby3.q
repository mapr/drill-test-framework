select c_row, c_groupby, cast(c_decimal9 as decimal(9,5)) from data where c_row > 16 order by c_groupby asc, cast(c_decimal9 as decimal(9,5)) desc;
