select c_date, c_integer, min(c_integer) over() from j1_v order by 1, 2, 3;
