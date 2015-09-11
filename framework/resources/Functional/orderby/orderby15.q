select c_row, c_groupby, cast(c_decimal38 as decimal(38,18)) from data where c_row < 15 order by c_groupby asc, cast(c_decimal38 as decimal(38,18)) desc;
