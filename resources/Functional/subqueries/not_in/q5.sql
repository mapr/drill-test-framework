--arithmetic expression in not in clause
select * from j2 where c_integer not in ( select round(c_integer/10) from j6 );
