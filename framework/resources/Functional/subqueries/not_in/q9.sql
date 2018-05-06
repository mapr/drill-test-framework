-- NLJ in multiple major fragments
select count(*) from j1 where c_date not in ( select c_date from j2 where c_float not in ( select cast(max(c_integer)*0.012 as double) from j6));
