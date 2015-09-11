select c_row, c_groupby, cast(c_decimal18 as decimal(18,4)) from data where c_row > 15 order by c_groupby asc, cast(c_decimal18 as decimal(18,4)) desc;
