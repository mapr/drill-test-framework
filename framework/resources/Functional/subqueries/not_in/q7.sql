-- scalar aggregate expression in not in clause
select * from j2 where c_float not in ( select max(c_integer)*0.012 from j6);
