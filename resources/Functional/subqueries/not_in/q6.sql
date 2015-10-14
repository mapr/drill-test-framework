-- scalar aggregate in not in clause
select * from j2 where c_integer not in ( select max(c_integer) from j6);
